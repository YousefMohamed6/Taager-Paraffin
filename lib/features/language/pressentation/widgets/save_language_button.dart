import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tager_paraffin/features/language/pressentation/manager/language_provider.dart';
import 'package:tager_paraffin/core/widgets/custom_button.dart';
import 'package:tager_paraffin/features/onboard/pressentation/views/onboard_view.dart';

class SaveLanguageButton extends StatelessWidget {
  const SaveLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: CustomButton(
        minWidth: MediaQuery.sizeOf(context).width * 0.8,
        onPressed: () async {
          context.read<LanguageProvider>().saveLanguage();
          context.goNamed(OnBoardView.routeName);
        },
        text: AppLocalizations.of(context)!.save,
      ),
    );
  }
}
