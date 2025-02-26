import 'package:flutter/material.dart';
import 'package:tager_paraffin/core/managers/styles_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ORText extends StatelessWidget {
  const ORText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.or,
      textAlign: TextAlign.center,
      style: StyleManager.textStyle24,
    );
  }
}
