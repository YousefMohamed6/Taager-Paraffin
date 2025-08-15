import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tager_paraffin/core/widgets/custom_label_widget.dart';

class CustomOnBoardItem extends StatelessWidget {
  const CustomOnBoardItem(
      {super.key, required this.imagePath, required this.text});
  final String imagePath;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath),
        SizedBox(height: 16.h),
        CustomLabel(text: text),
      ],
    );
  }
}
