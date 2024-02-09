import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tager_paraffin/core/uitls/route_manager.dart';
import 'package:tager_paraffin/generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();
  static const _instance = MyApp._internal();
  factory MyApp() => _instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      locale: const Locale("en"),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routerConfig: RouteManager.routConfig,
    );
  }
}
