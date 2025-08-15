<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/features/maps/presentation/manager/maps_cubit.dart';

class CustomTextFieldSearch extends StatelessWidget {
  const CustomTextFieldSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MapsCubit>();
    return Positioned(
      top: 8,
      left: 16,
      right: 16,
      child: TextField(
        onChanged: (value) async => await cubit.searchLocation(value),
        controller: cubit.locationSearchController,
        onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
        decoration: const InputDecoration(
          suffixIcon: SearchPlaceButton(),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          label: Text('Search Location'),
        ),
      ),
    );
  }
}

class SearchPlaceButton extends StatelessWidget {
  const SearchPlaceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () async {
        final cubit = context.read<MapsCubit>();
        final input = cubit.locationSearchController.text;
        await cubit.searchLocation(input);
      },
    );
  }
}
=======
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/features/maps/presentation/manager/maps_cubit.dart';

class CustomTextFieldSearch extends StatelessWidget {
  const CustomTextFieldSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MapsCubit>();
    return Positioned(
      top: 8,
      left: 16,
      right: 16,
      child: TextField(
        onChanged: (value) async => await cubit.searchLocation(value),
        controller: cubit.locationSearchController,
        onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
        decoration: const InputDecoration(
          suffixIcon: SearchPlaceButton(),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          label: Text('Search Location'),
        ),
      ),
    );
  }
}

class SearchPlaceButton extends StatelessWidget {
  const SearchPlaceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () async {
        final cubit = context.read<MapsCubit>();
        final input = cubit.locationSearchController.text;
        await cubit.searchLocation(input);
      },
    );
  }
}
>>>>>>> e1be5033add3d48e73b1409a31d21df9a80ea207
