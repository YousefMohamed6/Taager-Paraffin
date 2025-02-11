import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/features/maps/presentation/manager/maps_cubit.dart';
import 'package:tager_paraffin/features/maps/presentation/views/widgets/cutom_map_view.dart';
import 'package:tager_paraffin/features/maps/presentation/views/widgets/find_location_button.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});
  static const String routeName = "/MapScreen";

  // San Francisco
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapsCubit()..initState(),
      child: Scaffold(
        floatingActionButton: FindLocationButton(),
        appBar: AppBar(
          title: Text('Google Maps'),
          backgroundColor: Colors.green[700],
        ),
        body: CustomMapView(),
      ),
    );
  }
}
