import 'package:location/location.dart';
import 'package:tager_paraffin/core/services/location_service.dart';

class GetUserLocation {
  final LocationService locationService;

  GetUserLocation(this.locationService);
  Future<LocationData?> execute() async =>
      await locationService.getUserLocation();
}
