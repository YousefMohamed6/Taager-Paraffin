import 'package:flutter/material.dart';
import 'package:tager_paraffin/core/managers/assets_manager.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key, this.height, this.width, this.fit});
  final double? height;
  final double? width;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsManager.splashLogo,
      width: width,
      height: height,
      fit: fit ?? BoxFit.fill,
    );
  }
}
