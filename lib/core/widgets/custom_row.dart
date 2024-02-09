import 'package:flutter/material.dart';
import 'package:tager_paraffin/core/uitls/styles_manager.dart';

class CustomRow extends StatelessWidget {
  const CustomRow(
      {super.key,
      required this.text,
      required this.textbutton,
      required this.onPressed});
  final String text;
  final String textbutton;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          text,
          style: StyleManager.textStyle16,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textbutton,
            style: StyleManager.textStyle16,
          ),
        )
      ],
    );
  }
}
