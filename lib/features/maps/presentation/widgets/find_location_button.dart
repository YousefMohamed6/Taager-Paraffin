import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/features/maps/presentation/manager/maps_cubit.dart';

class FindLocationButton extends StatelessWidget {
  const FindLocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.location_on,
        size: 32,
      ),
      onPressed: () async {
        final cubit = context.read<MapsCubit>();
        await cubit.navigateToUserLocation();
      },
    );
  }
}
