import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tager_paraffin/core/uitls/show_message.dart';
import 'package:tager_paraffin/features/maps/presentation/manager/maps_cubit.dart';

class CustomMapView extends StatefulWidget {
  const CustomMapView({super.key});

  @override
  State<CustomMapView> createState() => _CustomMapViewState();
}

class _CustomMapViewState extends State<CustomMapView> {
  final LatLng _initialPosition = const LatLng(37.7749, -122.4194);
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MapsCubit>();
    return BlocListener<MapsCubit, MapsState>(
        listener: (context, state) {
          if (state is Error) {
            ShowMessage.show(msg: state.message);
          }
        },
        child: GoogleMap(
          zoomControlsEnabled: false,
          onMapCreated: cubit.onMapCreated,
          markers: cubit.markers,
          initialCameraPosition: CameraPosition(
            target: _initialPosition,
            zoom: 10.0,
          ),
        ));
  }
}
