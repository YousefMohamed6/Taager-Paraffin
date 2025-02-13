import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tager_paraffin/core/managers/assets_manager.dart';
import 'package:tager_paraffin/features/language/pressentation/manager/language_provider.dart';
import 'package:tager_paraffin/features/language/pressentation/widgets/language_item.dart';

class LanguageItems extends StatelessWidget {
  const LanguageItems({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageProvider provider = context.read<LanguageProvider>();
    return Directionality(
      textDirection: provider.isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomLanguageItem(
            language: AppLocalizations.of(context)!.arabic,
            selected: provider.isArabic,
            onPressed: () async {
              context.read<LanguageProvider>().setLocale('ar');
            },
            imagePath: AssetsManager.arabicFlag,
          ),
          CustomLanguageItem(
            language: AppLocalizations.of(context)!.english,
            selected: !provider.isArabic,
            onPressed: () async {
              context.read<LanguageProvider>().setLocale('en');
            },
            imagePath: AssetsManager.englishFlag,
          ),
        ],
      ),
    );
  }
}
