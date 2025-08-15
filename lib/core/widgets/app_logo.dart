import 'package:flutter/material.dart';
import 'package:tager_paraffin/features/splash/widgets/splash_logo.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashLogo(
      height: MediaQuery.sizeOf(context).height * 0.25,
      width: MediaQuery.sizeOf(context).width * 0.15,
      fit: BoxFit.contain,
    );
  }
}
