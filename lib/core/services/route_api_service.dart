import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteApiService {
  Dio get _dio {
    final BaseOptions options = BaseOptions(
      headers: _headers,
    );
    return Dio(options);
  }

  Map<String, String> get _headers => {
        'Content-Type': 'application/json',
        'X-Goog-Api-Key': _apiKey,
        'X-Goog-FieldMask':
            'routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline',
      };
  String get _apiKey => 'AIzaSyCCK7HKJkTpmWkONgC_K-g27n6iWL31ZAo';
  Map<String, dynamic> getBody({
    required LatLng origin,
    required LatLng destination,
  }) =>
      {
        "origin": {
          "location": {
            "latLng": {
              "latitude": origin.latitude,
              "longitude": origin.longitude
            }
          }
        },
        "destination": {
          "location": {
            "latLng": {
              "latitude": destination.latitude,
              "longitude": destination.longitude
            }
          }
        },
        "travelMode": "DRIVE",
        "routingPreference": "TRAFFIC_AWARE",
        "computeAlternativeRoutes": false,
        "routeModifiers": {
          "avoidTolls": false,
          "avoidHighways": false,
          "avoidFerries": false
        },
        "languageCode": "en-US",
        "units": "IMPERIAL"
      };
  Future<Response> getRoute({
    required LatLng origin,
    required LatLng destination,
  }) async {
    final response = await _dio.post(
      'https://routes.googleapis.com/directions/v2:computeRoutes',
      data: getBody(
        origin: origin,
        destination: destination,
      ),
    );
    return response;
  }
}
