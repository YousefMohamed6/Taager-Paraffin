import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:tager_paraffin/core/services/google_map_service.dart';
import 'package:tager_paraffin/core/services/location_service.dart';
<<<<<<< HEAD
=======
import 'package:tager_paraffin/core/services/google_map_service.dart';
>>>>>>> e1be5033add3d48e73b1409a31d21df9a80ea207
import 'package:tager_paraffin/features/maps/data/models/place_details/place_details.dart';
import 'package:tager_paraffin/features/maps/data/models/place_model/place_model.dart';
import 'package:tager_paraffin/features/maps/domain/use_cases/get_encode_route_use_case.dart';
import 'package:tager_paraffin/features/maps/domain/use_cases/get_place_details_use_case.dart';
import 'package:tager_paraffin/features/maps/domain/use_cases/get_plases_use_case.dart';
import 'package:tager_paraffin/features/maps/domain/use_cases/get_user_location.dart';
import 'package:uuid/uuid.dart';

part 'maps_cubit.freezed.dart';
part 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  final GoogleMapService mapService = GoogleMapService();
  final LocationService locationService;
  final String userMarkerId = 'user_location';
  final GetPlacesUseCase getPlasesUseCase;
  final GetPlaceDetailsUseCase getPlaceDetailsUseCase;
  final GetUserLocation getUserLocation;
  final GetEncodeRouteUseCase getEncodeRouteUseCase;
  final locationSearchController = TextEditingController();
  MapsCubit(
    this.getPlasesUseCase,
    this.getUserLocation,
    this.getPlaceDetailsUseCase,
    this.getEncodeRouteUseCase,
    this.locationService,
  ) : super(const MapsState.initial());
  List<PlaceModel> placesList = [];
  LatLng currentUserLocation = const LatLng(0, 0);
  LatLng selectedLocation = const LatLng(0, 0);
  final Uuid uuid = const Uuid();
  bool isNewSeccion = true;
  String seccionToken = '';
  String get newSeccionToken => uuid.v4();
  void addMarkerToLocation(LatLng latlng, String markerId) async {
    emit(const MapsState.loading());
    mapService.addMarkerToLocation(latlng: latlng, markerId: markerId);
    final Marker myMarker = mapService.markers
        .firstWhere((marker) => marker.markerId.value == markerId);
    emit(MapsState<Marker>.success(myMarker));
  }

  void addPolylineToLocation(List<LatLng> points) async {
    emit(const MapsState.loading());
    mapService.addPolylineToLocation(points: points, polylineId: 'polyline_1');
    final Polyline polyline = mapService.polylines
        .firstWhere((polyline) => polyline.polylineId.value == 'polyline_1');
    emit(MapsState<Polyline>.success(polyline));
  }

  Timer? _debounce;
  Future<void> searchLocation(String input) async {
    try {
      if (input.isEmpty) return;
      if (_debounce?.isActive ?? false) _debounce!.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () async {
        emit(const MapsState.loading());
        isNewSeccion ? seccionToken = newSeccionToken : null;
        final List<PlaceModel> places = await getPlasesUseCase.execute(
          input: input,
          sessiontoken: seccionToken,
        );
        placesList = places;
        isNewSeccion = false;
        emit(MapsState<List<PlaceModel>>.success(places));
      });
    } catch (e) {
      emit(MapsState.failure(e.toString()));
    }
  }

  void clearMarkersAndPolylines() {
    emit(const MapsState.loading());
    mapService.markers.clear();
    mapService.polylines.clear();
    emit(const MapsState.success([]));
  }

  void clearSearchData() {
    emit(const MapsState.loading());
    placesList.clear();
    emit(const MapsState.success([]));
  }

  Future<void> navigateToPlace(String placeId) async {
    try {
      emit(const MapsState.loading());
      final PlaceDetails placeDetails = await getPlaceDetailsUseCase.execute(
        placeId,
      );
      final location = placeDetails.geometry?.location;
      selectedLocation = LatLng(location?.lat ?? 0, location?.lng ?? 0);
      addMarkerToLocation(selectedLocation, 'selected_location');
      addMarkerToLocation(currentUserLocation, userMarkerId);
      final String encodedRoute = await getEncodeRouteUseCase.execute(
        origin: currentUserLocation,
        destination: selectedLocation,
      );
      final List<LatLng> points = await decodePolyline(encodedRoute);
      final latLngBounds = mapService.getLatLngBounds(points);
      await mapService.animateCameraToLatLngBounds(latLngBounds: latLngBounds);
      isNewSeccion = true;
      emit(const MapsState<bool>.success(true));
    } catch (e) {
      emit(MapsState.failure(e.toString()));
    }
  }

  Future<List<LatLng>> decodePolyline(String encodedString) async {
    final PolylinePoints polylinePoints = PolylinePoints(apiKey: '');
    final List<PointLatLng> result =
        PolylinePoints.decodePolyline(encodedString);
    final List<LatLng> points =
        result.map((e) => LatLng(e.latitude, e.longitude)).toList();
    return points;
  }

  Future<void> getDirection() async {
    try {
      locationService.listenToUserLocation(
        onLocationChanged: (LocationData locationData) async {
          final userLocation =
              LatLng(locationData.latitude!, locationData.longitude!);
          addMarkerToLocation(userLocation, userMarkerId);
        },
        distanceFilter: 0,
      );
<<<<<<< HEAD
    } on LocationServiceException catch (e) {
      //  TODO:
    } on LocationPermissionException catch (e) {
      //  TODO:
    } on DeniedForeverException catch (e) {
=======
    } on LocationServiceException {
      //  TODO:
    } on LocationPermissionException {
      //  TODO:
    } on DeniedForeverException {
>>>>>>> e1be5033add3d48e73b1409a31d21df9a80ea207
      //  TODO:
    } catch (e) {
      emit(MapsState.failure(e.toString()));
    }
  }

  @override
  Future<void> close() async {
    mapService.mapController?.dispose();
    _debounce?.cancel();
    super.close();
  }
}
