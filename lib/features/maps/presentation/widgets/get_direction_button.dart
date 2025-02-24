import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/widgets/custom_label_widget.dart';
import 'package:tager_paraffin/features/maps/presentation/manager/maps_cubit.dart';

class GetDirectionButton extends StatelessWidget {
  const GetDirectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: context.read<MapsCubit>().getDirection,
      child: const CustomLabel(text: 'Get Direction'),
    );
  }
}
