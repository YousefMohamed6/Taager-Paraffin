import 'package:flutter/material.dart';
import 'package:tager_paraffin/core/uitls/styles_manager.dart';
import 'package:tager_paraffin/generated/l10n.dart';

class ORText extends StatelessWidget {
  const ORText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).or,
      textAlign: TextAlign.center,
      style: StyleManager.textStyle24,
    );
  }
}