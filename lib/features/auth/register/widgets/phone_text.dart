import 'package:flutter/material.dart';
import 'package:tager_paraffin/core/managers/styles_manager.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';

class PhoneText extends StatelessWidget {
  const PhoneText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.phone,
      style: StyleManager.textStyle20,
    );
  }
}
