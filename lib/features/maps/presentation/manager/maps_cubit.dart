import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'maps_cubit.freezed.dart';
part 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  MapsCubit() : super(const MapsState.initial());
  Position? currentPostion;
  late GoogleMapController mapController;
  final TextEditingController locationController = TextEditingController();
  Set<Marker> markers = {};
  Future<void> initState() async {
    try {
      emit(const MapsState.loading());
      await getUserPostion();
      if (currentPostion == null) {
        emit(const MapsState.failure('Location services are disabled.'));
        return;
      }
      emit(MapsState<Position>.success(currentPostion!));
    } catch (e) {
      emit(MapsState.failure(e.toString()));
    }
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  Future<void> getUserPostion() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(const MapsState.failure('Location services are disabled.'));
      return;
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      emit(const MapsState.failure(
          'Location permissions are permanently denied, we cannot request permissions.'));
      return;
    }
    currentPostion = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  LatLng get _latlng => LatLng(
        currentPostion?.latitude ?? 0,
        currentPostion?.longitude ?? 0,
      );
  Future<void> navigateToCurrentLocation() async {
    await mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _latlng,
          zoom: 15,
        ),
      ),
    );
    addMarkerToCurrentLocation(_latlng);
  }

  Timer? _debounce;

  Future<void> onCamaraPotionChanged(CameraPosition position) async {
    addMarkerToCurrentLocation(position.target);
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(seconds: 1), () async {
      final String title = await getAddressName(position.target);
      locationController.text = title;
    });
  }

  void addMarkerToCurrentLocation(LatLng latlng) {
    emit(const MapsState.loading());
    final Marker myMarker = Marker(
      markerId: const MarkerId('marker_1'),
      position: latlng,
      infoWindow: InfoWindow(title: locationController.text),
    );
    markers.add(myMarker);
    emit(MapsState<Marker>.success(myMarker));
  }

  Future<String> getAddressName(LatLng latlng) async {
    String address = "UnKnwon Address";
    try {
      final List<Placemark> placemark =
          await placemarkFromCoordinates(latlng.latitude, latlng.longitude);
      address = placemark.first.name ?? address;
    } catch (e) {
      emit(MapsState.failure(e.toString()));
    }
    return address;
  }

  @override
  Future<void> close() async {
    mapController.dispose();
    super.close();
  }
}
