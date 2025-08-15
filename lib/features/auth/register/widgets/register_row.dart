<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:tager_paraffin/core/widgets/custom_row.dart';
import 'package:tager_paraffin/features/auth/login/view/login_view.dart';

class RegisterRow extends StatelessWidget {
  const RegisterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRow(
      text: AppLocalizations.of(context)!.haveAccount,
      textbutton: AppLocalizations.of(context)!.loginNow,
      onPressed: () {
        context.pushNamed(LoginView.routeName);
      },
    );
  }
}
=======
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tager_paraffin/core/widgets/custom_row.dart';
import 'package:tager_paraffin/features/auth/login/view/login_view.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';

class RegisterRow extends StatelessWidget {
  const RegisterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRow(
      text: AppLocalizations.of(context)!.haveAccount,
      textbutton: AppLocalizations.of(context)!.loginNow,
      onPressed: () {
        context.pushNamed(LoginView.routeName);
      },
    );
  }
}
>>>>>>> e1be5033add3d48e73b1409a31d21df9a80ea207
