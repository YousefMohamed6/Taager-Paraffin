import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tager_paraffin/core/uitls/styles_manager.dart';
import 'package:tager_paraffin/features/auth/forget_Password/view/forget_password_view.dart';
import 'package:tager_paraffin/generated/l10n.dart';

class ForgetPasswordTextButton extends StatelessWidget {
  const ForgetPasswordTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          child: Text(
            S.of(context).forgetPassword,
            style: StyleManager.textStyle16,
          ),
          onPressed: () {
            context.pushNamed(ForgetPasswordView.routeName);
          },
        ),
      ],
    );
  }
}