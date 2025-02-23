import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tager_paraffin/features/maps/data/models/place_details/place_details.dart';
import 'package:tager_paraffin/features/maps/data/models/place_model/place_model.dart';

abstract class IMapRepo {
  Future<List<PlaceModel>> getPredictions(
      {required String input, required String sessiontoken});
  Future<PlaceDetails> getPlaceDetails({required String placeId});
  Future<String> getRoute(
      {required LatLng origin, required LatLng destination});
}
