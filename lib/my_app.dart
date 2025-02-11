import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tager_paraffin/core/managers/colors_manager.dart';
import 'package:tager_paraffin/core/managers/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();
  static const _instance = MyApp._internal();
  factory MyApp() => _instance;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ColorsManager.borderSideColor,
        ),
        themeMode: ThemeMode.system,
        locale: const Locale("en"),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en'),
          const Locale('ar'),
        ],
        routerConfig: RouteManager.routConfig,
      ),
    );
  }
}
