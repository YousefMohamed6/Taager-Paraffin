import 'package:get_it/get_it.dart';
import 'package:tager_paraffin/core/extentions/getit_extension.dart';
import 'package:tager_paraffin/core/services/location_service.dart';
import 'package:tager_paraffin/core/services/map_service.dart';
import 'package:tager_paraffin/core/services/places_api_service.dart';
import 'package:tager_paraffin/core/services/route_api_service.dart';
import 'package:tager_paraffin/features/maps/data/repos/map_repo_impl.dart';
import 'package:tager_paraffin/features/maps/domain/repos/i_map_reop.dart';
import 'package:tager_paraffin/features/maps/domain/use_cases/get_encode_route_use_case.dart';
import 'package:tager_paraffin/features/maps/domain/use_cases/get_place_details_use_case.dart';
import 'package:tager_paraffin/features/maps/domain/use_cases/get_plases_use_case.dart';
import 'package:tager_paraffin/features/maps/domain/use_cases/get_user_location.dart';
import 'package:tager_paraffin/features/maps/presentation/manager/maps_cubit.dart';

class GoogleMapsService {
  final sl = GetIt.instance;

  void initDi() {
    sl.registerSingletonSafely<MapService>(
      MapService(),
    );
    sl.registerSingletonSafely<LocationService>(
      LocationService(),
    );
    sl.registerSingletonSafely<PlacesApiService>(
      PlacesApiService(),
    );
    sl.registerSingletonSafely<RouteApiService>(
      RouteApiService(),
    );
    sl.registerSingletonSafely<IMapRepo>(
      MapRepoImpl(
        placesApiService: sl(),
        routeApiService: sl(),
      ),
    );
    sl.registerSingletonSafely<GetPlacesUseCase>(
      GetPlacesUseCase(sl()),
    );
    sl.registerSingletonSafely<GetUserLocation>(
      GetUserLocation(sl()),
    );
    sl.registerSingletonSafely<GetPlaceDetailsUseCase>(
      GetPlaceDetailsUseCase(
        sl(),
      ),
    );
    sl.registerSingletonSafely<GetEncodeRouteUseCase>(
      GetEncodeRouteUseCase(sl()),
    );
    sl.registerFactorySafely<MapsCubit>(
      () => MapsCubit(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
  }
}
