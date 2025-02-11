import 'package:flutter/material.dart';
import 'package:tager_paraffin/core/managers/styles_manager.dart';

class CustomLabel extends StatelessWidget {
  const CustomLabel({
    super.key,
    required this.text,
    this.textStyle,
    this.color,
  });
  final String text;
  final TextStyle? textStyle;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ??
          StyleManager.textStyle16.copyWith(
            color: color,
          ),
    );
  }
}
