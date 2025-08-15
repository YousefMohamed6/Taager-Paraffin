<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';
import 'package:tager_paraffin/core/managers/styles_manager.dart';

class NameText extends StatelessWidget {
  const NameText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.name,
      style: StyleManager.textStyle20,
    );
  }
}
=======
import 'package:flutter/material.dart';
import 'package:tager_paraffin/core/managers/styles_manager.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';

class NameText extends StatelessWidget {
  const NameText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.name,
      style: StyleManager.textStyle20,
    );
  }
}
>>>>>>> e1be5033add3d48e73b1409a31d21df9a80ea207
