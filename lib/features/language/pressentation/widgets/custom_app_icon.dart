import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tager_paraffin/core/managers/assets_manager.dart';

class CustomAppIcon extends StatelessWidget {
  const CustomAppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AssetsManager.splashLogo,
        width: (MediaQuery.sizeOf(context).width * 0.3).w,
      ),
    );
  }
}
