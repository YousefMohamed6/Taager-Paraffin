import 'package:tager_paraffin/features/maps/data/models/place_details/place_details.dart';
import 'package:tager_paraffin/features/maps/domain/repos/i_map_reop.dart';

class GetPlaceDetailsUseCase {
  final IMapRepo mapReop;
  GetPlaceDetailsUseCase(this.mapReop);
  Future<PlaceDetails> execute(String placeId) async {
    return await mapReop.getPlaceDetails(placeId: placeId);
  }
}
