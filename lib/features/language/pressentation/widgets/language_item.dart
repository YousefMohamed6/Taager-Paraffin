import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tager_paraffin/core/widgets/custom_label_widget.dart';

class CustomLanguageItem extends StatelessWidget {
  const CustomLanguageItem({
    super.key,
    required this.language,
    required this.selected,
    required this.onPressed,
    required this.imagePath,
  });
  final String language;
  final bool selected;
  final VoidCallback onPressed;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: (MediaQuery.sizeOf(context).width * 0.30).w,
        height: (MediaQuery.sizeOf(context).height * 0.25).h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: selected
                  ? Icon(
                      Icons.check_circle,
                      color: Theme.of(context).primaryColor,
                      size: 25.h,
                    )
                  : const SizedBox(),
            ),
            SizedBox(height: 16.h),
            Image.asset(
              imagePath,
              width: 50.w,
              height: 50.h,
            ),
            CustomLabel(
              text: language,
            ),
          ],
        ),
      ),
    );
  }
}
