import 'package:get_it/get_it.dart';
import 'package:location/location.dart';

class LocationService {
  LocationService._();
  static final LocationService instance = LocationService._();
  factory LocationService() => instance;
  final Location userLocation = Location();
  Future<void> _checkAndRequestLocationPermission() async {
    PermissionStatus permissionStatus = await userLocation.hasPermission();
    if (permissionStatus == PermissionStatus.deniedForever) {
      throw DeniedForeverException();
    } else if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await userLocation.requestPermission();
    }
    throwIf(
      permissionStatus != PermissionStatus.granted &&
          permissionStatus != PermissionStatus.grantedLimited,
      LocationPermissionException(),
    );
  }

  Future<void> _checkAndRequestLocationService() async {
    bool serviceEnabled = await userLocation.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await userLocation.requestService();
    }
    throwIf(!serviceEnabled, LocationServiceException());
  }

  Future<void> checkLocationEnable() async {
    await _checkAndRequestLocationService();
    await _checkAndRequestLocationPermission();
  }

  Future<LocationData> getUserLocation() async {
    await checkLocationEnable();
    return await userLocation.getLocation();
  }

  Future<void> listenToUserLocation({
    required void Function(LocationData) onLocationChanged,
    double? distanceFilter,
  }) async {
    await checkLocationEnable();
    userLocation.changeSettings(distanceFilter: distanceFilter ?? 5);
    userLocation.onLocationChanged.listen(
      onLocationChanged,
    );
  }
}

class LocationServiceException implements Exception {}

class LocationPermissionException implements Exception {}

class DeniedForeverException implements Exception {}
