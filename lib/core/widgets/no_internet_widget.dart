import 'package:flutter/material.dart';
import 'package:tager_paraffin/core/managers/assets_manager.dart';
import 'package:tager_paraffin/core/managers/styles_manager.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // [Material] is required to display Flutter widgets.
    return Material(
      color: const Color.fromARGB(170, 74, 74, 74),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsManager.noInternet),
            Text(
              AppLocalizations.of(context)!.no_internet,
              textAlign: TextAlign.center,
              style: StyleManager.textStyle16
                  .copyWith(fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}
