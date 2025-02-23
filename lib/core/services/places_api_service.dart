import 'package:dio/dio.dart';

class PlacesApiService {
  final String _apiKey = 'AIzaSyCCK7HKJkTpmWkONgC_K-g27n6iWL31ZAo';
  Map<String, String> get _headers => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
  Dio get _dio {
    final String baseUrl = 'https://maps.googleapis.com/maps/api/place/';
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: _headers,
    );
    return Dio(options);
  }

  Future<Response> getPredictions({
    required String input,
    required String sessiontoken,
  }) async {
    final response = await _dio.get(
        'autocomplete/json?input=$input&key=$_apiKey&sessiontoken=$sessiontoken');
    return response;
  }

  Future<Response> getPlaceDetails(String placeId) async {
    final response =
        await _dio.get('details/json?place_id=$placeId&key=$_apiKey');
    return response;
  }
}
