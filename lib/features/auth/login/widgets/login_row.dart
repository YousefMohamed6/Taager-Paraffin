import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tager_paraffin/core/widgets/custom_row.dart';
import 'package:tager_paraffin/features/auth/register/view/register_view.dart';
import 'package:tager_paraffin/generated/l10n.dart';

class LoginRow extends StatelessWidget {
  const LoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRow(
      text: S.of(context).noAccount,
      textbutton: S.of(context).registerNow,
      onPressed: () {
        context.pushNamed(RegisterView.routeName);
      },
    );
  }
}
