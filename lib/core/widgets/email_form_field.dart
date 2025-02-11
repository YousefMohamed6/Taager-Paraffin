import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tager_paraffin/core/managers/colors_manager.dart';
import 'package:tager_paraffin/core/managers/values_manager.dart';
import 'package:tager_paraffin/core/widgets/custom_form_filed.dart';

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
