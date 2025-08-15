import 'package:tager_paraffin/features/maps/data/models/place_model/place_model.dart';
import 'package:tager_paraffin/features/maps/domain/repos/i_map_reop.dart';

class GetPlacesUseCase {
  final IMapRepo repo;

  GetPlacesUseCase(this.repo);

  Future<List<PlaceModel>> execute(
          {required String input, required String sessiontoken}) async =>
      await repo.getPredictions(input: input, sessiontoken: sessiontoken);
}
