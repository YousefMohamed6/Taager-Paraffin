import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tager_paraffin/core/managers/styles_manager.dart';
import 'package:tager_paraffin/core/uitls/show_message.dart';
import 'package:tager_paraffin/features/maps/presentation/manager/maps_cubit.dart';
import 'package:tager_paraffin/features/maps/presentation/widgets/custom_text_field_search.dart';

class CustomMapView extends StatefulWidget {
  const CustomMapView({super.key});

  @override
  State<CustomMapView> createState() => _CustomMapViewState();
}

class _CustomMapViewState extends State<CustomMapView> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MapsCubit>();
    return BlocConsumer<MapsCubit, MapsState>(
      listener: (context, state) {
        if (state is Error) {
          ShowMessage.show(msg: state.message);
        }
      },
      builder: (context, state) => SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              zoomControlsEnabled: false,
              markers: cubit.mapService.markers,
              polygons: cubit.mapService.polygons,
              polylines: cubit.mapService.polylines,
              circles: cubit.mapService.circles,
              onMapCreated: cubit.mapService.onMapCreated,
              initialCameraPosition: cubit.mapService.initialCameraPosition,
            ),
            Column(
              children: [
                const CustomTextFieldSearch(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  margin:
                      const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ListTile(
                      leading: const Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                      title: Text(
                        cubit.placesList[index].description,
                        style: StyleManager.textStyle16,
                      ),
                      onTap: () async {
                        final placeId = cubit.placesList[index].placeId ?? '';
                        cubit.clearSearchData();
                        cubit.clearMarkersAndPolylines();
                        await cubit.navigateToPlace(placeId);
                      },
                      trailing: const Icon(
                        Icons.call_made,
                      ),
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      height: 0,
                    ),
                    itemCount: cubit.placesList.length,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
