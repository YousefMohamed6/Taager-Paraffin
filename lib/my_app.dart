<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:tager_paraffin/core/managers/colors_manager.dart';
import 'package:tager_paraffin/core/managers/router_manager.dart';
import 'package:tager_paraffin/core/widgets/no_internet_widget.dart';
import 'package:tager_paraffin/features/language/pressentation/manager/language_provider.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();
  static const _instance = MyApp._internal();
  factory MyApp() => _instance;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LanguageProvider()..getLocale(),
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => const CustomMatrialApp(),
      ),
    );
  }
}

class CustomMatrialApp extends StatelessWidget {
  const CustomMatrialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) => Stack(
        children: [
          // child here represents the Route Widget: the current app screen content.
          if (child != null) child,
          StreamBuilder<InternetConnectionStatus>(
            stream: InternetConnectionChecker.instance.onStatusChange,
            builder: (context, snapshot) {
              final bool isConnected =
                  snapshot.data == InternetConnectionStatus.connected;
              if (isConnected) return const SizedBox();
              return const NoInternetWidget();
            },
          ),
        ],
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorsManager.primaryColor,
      ),
      locale: context.watch<LanguageProvider>().locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: RouterManager.routConfig,
    );
  }
}
=======
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:tager_paraffin/core/managers/colors_manager.dart';
import 'package:tager_paraffin/core/managers/router_manager.dart';
import 'package:tager_paraffin/core/widgets/no_internet_widget.dart';
import 'package:tager_paraffin/features/language/pressentation/manager/language_provider.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();
  static const _instance = MyApp._internal();
  factory MyApp() => _instance;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LanguageProvider()..getLocale(),
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => const CustomMatrialApp(),
      ),
    );
  }
}

class CustomMatrialApp extends StatelessWidget {
  const CustomMatrialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) => Stack(
        children: [
          // child here represents the Route Widget: the current app screen content.
          if (child != null) child,
          StreamBuilder<InternetConnectionStatus>(
            stream: InternetConnectionChecker.instance.onStatusChange,
            builder: (context, snapshot) {
              final bool isConnected =
                  snapshot.data == InternetConnectionStatus.connected;
              if (isConnected) return const SizedBox();
              return const NoInternetWidget();
            },
          ),
        ],
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorsManager.primaryColor,
      ),
      locale: context.watch<LanguageProvider>().locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: (locale, supportedLocales) {
        return context.watch<LanguageProvider>().locale;
      },
      routerConfig: RouterManager.routConfig,
    );
  }
}
>>>>>>> e1be5033add3d48e73b1409a31d21df9a80ea207
