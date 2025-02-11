import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tager_paraffin/core/managers/colors_manager.dart';
import 'package:tager_paraffin/core/managers/values_manager.dart';
import 'package:tager_paraffin/core/widgets/custom_form_filed.dart';
import 'package:tager_paraffin/core/widgets/visable_password_button.dart';

class PasswordFormFeild extends StatelessWidget {
  const PasswordFormFeild(
      {super.key,
      required this.password,
      required this.onVisablePressed,
      required this.obsecureText});
  final TextEditingController password;

  final VoidCallback onVisablePressed;
  final bool obsecureText;
  @override
  Widget build(BuildContext context) {
    return CustomFormFeiled(
      controller: password,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validatorText: AppLocalizations.of(context)!.enterPassword,
      keyboardType: TextInputType.visiblePassword,
      hintText: AppLocalizations.of(context)!.enterPassword,
      prefixIcon: const Icon(Icons.security_outlined),
      suffixIcon: VisablePasswordButton(
          isObsecureText: obsecureText, onPressed: onVisablePressed),
      obscureText: obsecureText,
      borderRedius: ValuesManager.borderRedius,
      borderSideColor: ColorsManager.borderSideColor,
      enableBorderRedius: ValuesManager.borderRedius,
      enableBorderSideColor: ColorsManager.enableBorderSideColor,
    );
  }
}
