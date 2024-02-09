import 'package:flutter/material.dart';
import 'package:tager_paraffin/core/uitls/colors_manager.dart';
import 'package:tager_paraffin/core/uitls/styles_manager.dart';
import 'package:tager_paraffin/core/uitls/values_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
     this.child,
    required this.onPressed,
    this.buttonColor,
    this.height,
    this.minWidth,
    this.text,
  });
  final Widget? child;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final double? height;
  final double? minWidth;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: buttonColor ?? ColorManager.primary,
      height: height ?? ValuesManager.buttonHeight,
      minWidth: minWidth,
      child: child ??
          Text(
            text!,
            style: StyleManager.textStyle20,
          ),
    );
  }
}
