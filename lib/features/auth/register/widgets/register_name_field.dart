import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/uitls/colors_manager.dart';
import 'package:tager_paraffin/core/uitls/values_manager.dart';
import 'package:tager_paraffin/core/widgets/custom_form_filed.dart';
import 'package:tager_paraffin/features/auth/register/register_cubit/register_cubit.dart';
import 'package:tager_paraffin/generated/l10n.dart';

class RegsiterNameFeild extends StatelessWidget {
  const RegsiterNameFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormFeiled(
      controller: BlocProvider.of<RegisterCubit>(context).name,
      validatorText: S.of(context).enterName,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      borderRedius: ValuesManager.borderRedius,
      borderSideColor: ColorManager.borderSideColor,
      enableBorderSideColor: ColorManager.enableBorderSideColor,
      enableBorderRedius: ValuesManager.borderRedius,
      hintText: S.of(context).enterName,
      prefixIcon: const Icon(Icons.person),
    );
  }
}
