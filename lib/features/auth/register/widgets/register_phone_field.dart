import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/uitls/colors_manager.dart';
import 'package:tager_paraffin/core/uitls/values_manager.dart';
import 'package:tager_paraffin/core/widgets/custom_form_filed.dart';
import 'package:tager_paraffin/features/auth/register/register_cubit/register_cubit.dart';
import 'package:tager_paraffin/generated/l10n.dart';

class RegsiterPhoneFeild extends StatelessWidget {
  const RegsiterPhoneFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormFeiled(
      controller: BlocProvider.of<RegisterCubit>(context).phone,
      validatorText: S.of(context).enterPhone,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.phone,
      borderRedius: ValuesManager.borderRedius,
      borderSideColor: ColorManager.borderSideColor,
      enableBorderSideColor: ColorManager.enableBorderSideColor,
      enableBorderRedius: ValuesManager.borderRedius,
      hintText: S.of(context).enterPhone,
      prefixIcon: const Icon(Icons.call),
    );
  }
}
