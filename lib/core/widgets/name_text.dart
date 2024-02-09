import 'package:flutter/material.dart';
import 'package:tager_paraffin/core/uitls/styles_manager.dart';
import 'package:tager_paraffin/generated/l10n.dart';

class NameText extends StatelessWidget {
  const NameText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).name,
      style: StyleManager.textStyle20,
    );
  }
}
