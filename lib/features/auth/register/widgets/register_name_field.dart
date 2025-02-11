import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tager_paraffin/core/managers/colors_manager.dart';
import 'package:tager_paraffin/core/managers/values_manager.dart';
import 'package:tager_paraffin/core/widgets/custom_form_filed.dart';
import 'package:tager_paraffin/features/auth/register/register_cubit/register_cubit.dart';

class RegsiterNameFeild extends StatelessWidget {
  const RegsiterNameFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormFeiled(
      controller: BlocProvider.of<RegisterCubit>(context).name,
      validatorText: AppLocalizations.of(context)!.enterName,
      keyboardType: TextInputType.name,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      borderRedius: ValuesManager.borderRedius,
      borderSideColor: ColorsManager.borderSideColor,
      enableBorderSideColor: ColorsManager.enableBorderSideColor,
      enableBorderRedius: ValuesManager.borderRedius,
      hintText: AppLocalizations.of(context)!.enterName,
      prefixIcon: const Icon(Icons.person),
    );
  }
}
