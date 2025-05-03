import 'package:flutter/material.dart';

class VisablePasswordButton extends StatelessWidget {
  const VisablePasswordButton(
      {super.key, required this.isObsecureText, required this.onPressed});
  final bool isObsecureText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: isObsecureText
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
      onPressed: onPressed,
    );
  }
}
