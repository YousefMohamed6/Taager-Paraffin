import 'package:flutter/material.dart';
import 'package:tager_paraffin/core/managers/styles_manager.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.appName,
      style: StyleManager.textStyle32.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
    );
  }
}
