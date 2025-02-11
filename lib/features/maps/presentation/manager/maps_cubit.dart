import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'maps_cubit.freezed.dart';
part 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  MapsCubit() : super(MapsState.initial());
  Position? currentPostion;
  late GoogleMapController mapController;
  Future<void> initState() async {
    try {
      emit(MapsState.loading());
      await getUserPostion();
      if (currentPostion == null) {
        emit(MapsState.failure('Location services are disabled.'));
        return;
      }
      emit(MapsState<Position>.success(currentPostion!));
    } catch (e) {
      emit(MapsState.failure(e.toString()));
    }
  }

  Set<Marker> markers = {
    Marker(
      markerId: MarkerId('marker_1'),
      position: LatLng(37.7749, -122.4194), // San Francisco
      infoWindow: InfoWindow(title: 'San Francisco'),
    ),
  };
  Future<void> onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  Future<void> getUserPostion() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(MapsState.failure('Location services are disabled.'));
      return;
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      emit(MapsState.failure(
          'Location permissions are permanently denied, we cannot request permissions.'));
      return;
    }
    currentPostion = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  LatLng get _latlng => LatLng(
        currentPostion?.altitude ?? 0,
        currentPostion?.longitude ?? 0,
      );
  Future<void> navigateToNewPosition() async {
    await mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _latlng,
          zoom: 15.0,
        ),
      ),
    );
    markers.clear();
    markers.add(
      Marker(
        markerId: MarkerId('marker_1'),
        position: _latlng,
        infoWindow: InfoWindow(title: 'San Francisco'),
        draggable: true,
      ),
    );
  }
}
