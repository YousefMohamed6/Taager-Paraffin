import 'package:flutter/material.dart';
import 'package:tager_paraffin/core/uitls/styles_manager.dart';
import 'package:tager_paraffin/generated/l10n.dart';

class PasswordText extends StatelessWidget {
  const PasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).password,
      style: StyleManager.textStyle18,
    );
  }
}
