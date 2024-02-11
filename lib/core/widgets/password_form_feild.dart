import 'package:flutter/material.dart';
import 'package:tager_paraffin/core/uitls/colors_manager.dart';
import 'package:tager_paraffin/core/uitls/values_manager.dart';
import 'package:tager_paraffin/core/widgets/custom_form_filed.dart';
import 'package:tager_paraffin/core/widgets/visable_password_button.dart';
import 'package:tager_paraffin/generated/l10n.dart';

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
      validatorText: S.of(context).enterPassword,
      keyboardType: TextInputType.visiblePassword,
      hintText: S.of(context).enterPassword,
      prefixIcon: const Icon(Icons.security_outlined),
      suffixIcon: VisablePasswordButton(
          isObsecureText: obsecureText, onPressed: onVisablePressed),
      obscureText: obsecureText,
      borderRedius: ValuesManager.borderRedius,
      borderSideColor: ColorManager.borderSideColor,
      enableBorderRedius: ValuesManager.borderRedius,
      enableBorderSideColor: ColorManager.enableBorderSideColor,
    );
  }
}
