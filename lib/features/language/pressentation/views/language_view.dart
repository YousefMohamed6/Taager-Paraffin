import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tager_paraffin/core/widgets/custom_label_widget.dart';
import 'package:tager_paraffin/core/widgets/screen_padding.dart';
import 'package:tager_paraffin/features/language/pressentation/widgets/custom_app_icon.dart';
import 'package:tager_paraffin/features/language/pressentation/widgets/language_items.dart';
import 'package:tager_paraffin/features/language/pressentation/widgets/save_language_button.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});
  static const String routeName = '/language';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: const SaveLanguageButton(),
      body: ScreenPadding(
        child: ScreenPadding(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppIcon(),
              SizedBox(height: 16.h),
              CustomLabel(text: AppLocalizations.of(context)!.select_language),
              SizedBox(height: 16.h),
              const LanguageItems(),
            ],
          ),
        ),
      ),
    );
  }
}
