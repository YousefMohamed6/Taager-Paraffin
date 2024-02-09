import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tager_paraffin/core/widgets/custom_row.dart';
import 'package:tager_paraffin/features/auth/login/view/login_view.dart';
import 'package:tager_paraffin/generated/l10n.dart';

class RegisterRow extends StatelessWidget {
  const RegisterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRow(
      text: S.of(context).haveAccount,
      textbutton: S.of(context).loginNow,
      onPressed: () {
        context.pushNamed(LoginView.routeName);
      },
    );
  }
}
