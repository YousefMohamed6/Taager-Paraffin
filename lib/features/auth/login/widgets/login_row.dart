<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tager_paraffin/core/widgets/custom_row.dart';
import 'package:tager_paraffin/features/auth/register/view/register_view.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';

class LoginRow extends StatelessWidget {
  const LoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRow(
      text: AppLocalizations.of(context)!.noAccount,
      textbutton: AppLocalizations.of(context)!.registerNow,
      onPressed: () {
        context.pushNamed(RegisterView.routeName);
      },
    );
  }
}
=======
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tager_paraffin/core/widgets/custom_row.dart';
import 'package:tager_paraffin/features/auth/register/view/register_view.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';

class LoginRow extends StatelessWidget {
  const LoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRow(
      text: AppLocalizations.of(context)!.noAccount,
      textbutton: AppLocalizations.of(context)!.registerNow,
      onPressed: () {
        context.pushNamed(RegisterView.routeName);
      },
    );
  }
}
>>>>>>> e1be5033add3d48e73b1409a31d21df9a80ea207
