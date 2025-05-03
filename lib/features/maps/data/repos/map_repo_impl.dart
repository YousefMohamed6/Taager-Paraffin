import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tager_paraffin/core/services/places_api_service.dart';
import 'package:tager_paraffin/core/services/route_api_service.dart';
import 'package:tager_paraffin/features/maps/data/models/place_details/place_details.dart';
import 'package:tager_paraffin/features/maps/data/models/place_model/place_model.dart';
import 'package:tager_paraffin/features/maps/data/models/routes_model/route.dart';
import 'package:tager_paraffin/features/maps/data/models/routes_model/routes_model.dart';
import 'package:tager_paraffin/features/maps/domain/repos/i_map_reop.dart';

class MapRepoImpl implements IMapRepo {
  final PlacesApiService placesApiService;
  final RouteApiService routeApiService;
  MapRepoImpl({
    required this.placesApiService,
    required this.routeApiService,
  });

  @override
  Future<List<PlaceModel>> getPredictions(
      {required String input, required String sessiontoken}) async {
    final Response response = await placesApiService.getPredictions(
        input: input, sessiontoken: sessiontoken);
    if (response.statusCode != 200) return [];
    final List predictions = response.data['predictions'];
    final List<PlaceModel> placesList =
        predictions.map((e) => PlaceModel.fromJson(e)).toList();
    return placesList;
  }

  @override
  Future<PlaceDetails> getPlaceDetails({required String placeId}) async {
    final Response response = await placesApiService.getPlaceDetails(placeId);
    if (response.statusCode != 200) return PlaceDetails();
    final PlaceDetails placeDetails =
        PlaceDetails.fromJson(response.data['result']);
    return placeDetails;
  }

  @override
  Future<String> getRoute({
    required LatLng origin,
    required LatLng destination,
  }) async {
    final Response response = await routeApiService.getRoute(
      origin: origin,
      destination: destination,
    );
    if (response.statusCode != 200) return '';
    RoutesModel routesModel = RoutesModel.fromJson(response.data);
    final RouteModel route = routesModel.routes!.first;
    return route.polyline?.encodedPolyline ?? '';
  }
}
