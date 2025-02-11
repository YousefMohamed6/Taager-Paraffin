import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tager_paraffin/core/uitls/show_message.dart';
import 'package:tager_paraffin/features/maps/presentation/manager/maps_cubit.dart';

class CustomMapView extends StatefulWidget {
  const CustomMapView({super.key});

  @override
  State<CustomMapView> createState() => _CustomMapViewState();
}

class _CustomMapViewState extends State<CustomMapView> {
  // final LatLng _initialPosition =
  //     const LatLng(37.7749, -122.4194); // San Francisco
  // late GoogleMapController mapController;

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Google Maps'),
  //       backgroundColor: Colors.green[700],
  //     ),
  //     body: GoogleMap(
  //       onMapCreated: _onMapCreated,
  //       initialCameraPosition: CameraPosition(
  //         target: _initialPosition,
  //         zoom: 10.0,
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MapsCubit>();
    return BlocConsumer<MapsCubit, MapsState>(
      listener: (context, state) {
        if (state is Error) {
          ShowMessage.show(msg: state.message);
        }
      },
      buildWhen: (previous, current) => current is Success<Position>,
      builder: (context, state) {
        if (state is Loading) {
          return Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (state is Failure) {
          return Center(
            child: Text(
              state.message,
            ),
          );
        }
        return GoogleMap(
          zoomControlsEnabled: false,
          onMapCreated: cubit.onMapCreated,
          markers: cubit.markers,
          initialCameraPosition: CameraPosition(
            target: LatLng(
              cubit.currentPostion?.altitude ?? 0,
              cubit.currentPostion?.longitude ?? 0,
            ),
            zoom: 10.0,
          ),
        );
      },
    );
  }
}
