import 'package:flutter/material.dart';

class CustomFormFeiled extends StatelessWidget {
  const CustomFormFeiled({
    super.key,
    required this.controller,
    required this.validatorText,
    this.fillColor,
    this.hintText,
    this.lableText,
    this.textAlign,
    this.hintTextStyle,
    this.lableTextStyle,
    this.onFieldSubmitted,
    this.autovalidateMode,
    this.suffixIcon,
    this.prefixIcon,
    required this.borderRedius,
    required this.borderSideColor,
    required this.enableBorderSideColor,
    required this.enableBorderRedius,
    this.inputStyle,
    this.obscureText,
    this.keyboardType,
  });
  final TextEditingController controller;
  final String validatorText;
  final Color? fillColor;
  final TextAlign? textAlign;
  final bool? obscureText;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextStyle? hintTextStyle;
  final String? lableText;
  final TextStyle? lableTextStyle;
  final TextStyle? inputStyle;
  final AutovalidateMode? autovalidateMode;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double borderRedius;
  final Color borderSideColor;
  final double enableBorderRedius;
  final Color enableBorderSideColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      onFieldSubmitted: onFieldSubmitted,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorText;
        }
        return null;
      },
      autovalidateMode: autovalidateMode,
      textAlign: textAlign ?? TextAlign.start,
      obscureText: obscureText ?? false,
      style: inputStyle,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: hintTextStyle,
        labelText: lableText,
        labelStyle: lableTextStyle,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderSideColor,
          ),
          borderRadius: BorderRadius.circular(
            borderRedius,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: enableBorderSideColor,
          ),
          borderRadius: BorderRadius.circular(
            enableBorderRedius,
          ),
        ),
      ),
    );
  }
}
