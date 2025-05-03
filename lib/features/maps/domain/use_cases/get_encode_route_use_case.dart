import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tager_paraffin/features/maps/domain/repos/i_map_reop.dart';

class GetEncodeRouteUseCase {
  final IMapRepo mapRepo;

  GetEncodeRouteUseCase(this.mapRepo);
  Future<String> execute({
    required LatLng origin,
    required LatLng destination,
  }) async {
    return await mapRepo.getRoute(origin: origin, destination: destination);
  }
}
