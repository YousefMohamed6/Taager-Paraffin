import 'package:flutter/material.dart';
import 'package:tager_paraffin/core/uitls/colors_manager.dart';
import 'package:tager_paraffin/core/uitls/values_manager.dart';
import 'package:tager_paraffin/core/widgets/custom_form_filed.dart';
import 'package:tager_paraffin/generated/l10n.dart';

class EmailFormFeild extends StatelessWidget {
  const EmailFormFeild({super.key, required this.email});
  final TextEditingController email;
  @override
  Widget build(BuildContext context) {
    return CustomFormFeiled(
      controller: email,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validatorText: S.of(context).enterEmail,
      hintText: S.of(context).enterEmail,
      prefixIcon: const Icon(Icons.email_outlined),
      borderRedius: ValuesManager.borderRedius,
      borderSideColor: ColorManager.borderSideColor,
      enableBorderRedius: ValuesManager.borderRedius,
      enableBorderSideColor: ColorManager.enableBorderSideColor,
    );
  }
}
