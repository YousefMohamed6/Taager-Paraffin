<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:tager_paraffin/core/managers/colors_manager.dart';
import 'package:tager_paraffin/core/managers/values_manager.dart';
import 'package:tager_paraffin/core/widgets/custom_form_filed.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';

class EmailFormFeild extends StatelessWidget {
  const EmailFormFeild({super.key, required this.email});
  final TextEditingController email;
  @override
  Widget build(BuildContext context) {
    return CustomFormFeiled(
      controller: email,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validatorText: AppLocalizations.of(context)!.enterEmail,
      keyboardType: TextInputType.emailAddress,
      hintText: AppLocalizations.of(context)!.enterEmail,
      prefixIcon: const Icon(Icons.email_outlined),
      borderRedius: ValuesManager.borderRedius,
      borderSideColor: ColorsManager.borderSideColor,
      enableBorderRedius: ValuesManager.borderRedius,
      enableBorderSideColor: ColorsManager.enableBorderSideColor,
    );
  }
}
=======
import 'package:flutter/material.dart';
import 'package:tager_paraffin/core/managers/colors_manager.dart';
import 'package:tager_paraffin/core/managers/values_manager.dart';
import 'package:tager_paraffin/core/widgets/custom_form_filed.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';

class EmailFormFeild extends StatelessWidget {
  const EmailFormFeild({super.key, required this.email});
  final TextEditingController email;
  @override
  Widget build(BuildContext context) {
    return CustomFormFeiled(
      controller: email,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validatorText: AppLocalizations.of(context)!.enterEmail,
      keyboardType: TextInputType.emailAddress,
      hintText: AppLocalizations.of(context)!.enterEmail,
      prefixIcon: const Icon(Icons.email_outlined),
      borderRedius: ValuesManager.borderRedius,
      borderSideColor: ColorsManager.borderSideColor,
      enableBorderRedius: ValuesManager.borderRedius,
      enableBorderSideColor: ColorsManager.enableBorderSideColor,
    );
  }
}
>>>>>>> e1be5033add3d48e73b1409a31d21df9a80ea207
