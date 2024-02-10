import 'package:flutter/material.dart';
import 'package:tager_paraffin/core/uitls/styles_manager.dart';
import 'package:tager_paraffin/generated/l10n.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
          S.of(context).appName,
          style: StyleManager.textStyle32.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 36,
          ),
        );
  }
}