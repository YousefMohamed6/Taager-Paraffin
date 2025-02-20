import 'package:flutter/material.dart';
import 'package:tager_paraffin/core/managers/colors_manager.dart';
import 'package:tager_paraffin/core/managers/keys_manager.dart';
import 'package:tager_paraffin/core/services/secure_storage_service.dart';

class ThemeManager extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  void toggleTheme(bool isLight) {
    themeMode = isLight ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  Future<void> getThemeFromLocalStorage() async {
    final String? value =
        await SecureStorageManager.storage.read(key: KeysManager.kThemeMode);
    bool isLight = bool.tryParse(value ?? 'true') ?? true;
    toggleTheme(isLight);
  }

  ThemeData get theme => themeMode == ThemeMode.light ? light() : dark();

  ThemeData light() => ThemeData(
        fontFamily: KeysManager.kFontFamily,
        primaryColor: ColorsManager.primaryColor,
        secondaryHeaderColor: const Color(0xFF4da2a9),
        disabledColor: const Color(0xFFBABFC4),
        brightness: Brightness.light,
        hintColor: const Color(0xFF9F9F9F),
        cardColor: Colors.white,
        shadowColor: Colors.black.withOpacity(0.03),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                foregroundColor: ColorsManager.primaryColor)),
        colorScheme: const ColorScheme.light(
                primary: ColorsManager.primaryColor,
                secondary: ColorsManager.primaryColor)
            .copyWith(surface: const Color(0xFFFCFCFC))
            .copyWith(error: const Color(0xFFE84D4F)),
        popupMenuTheme: const PopupMenuThemeData(
            color: Colors.white, surfaceTintColor: Colors.white),
        dialogTheme: const DialogTheme(surfaceTintColor: Colors.white),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(500))),
        bottomAppBarTheme: const BottomAppBarTheme(
          surfaceTintColor: Colors.white,
          height: 60,
          padding: EdgeInsets.symmetric(vertical: 5),
        ),
        dividerTheme:
            const DividerThemeData(thickness: 0.2, color: Color(0xFFA0A4A8)),
        tabBarTheme: const TabBarTheme(dividerColor: Colors.transparent),
      );

  ThemeData dark() => ThemeData(
        fontFamily: KeysManager.kFontFamily,
        primaryColor: ColorsManager.primaryColor,
        secondaryHeaderColor: const Color(0xFF4da2a9),
        disabledColor: const Color(0xffa2a7ad),
        brightness: Brightness.dark,
        hintColor: const Color(0xFFbebebe),
        cardColor: const Color(0xFF30313C),
        shadowColor: Colors.white.withOpacity(0.03),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                foregroundColor: ColorsManager.primaryColor)),
        colorScheme: const ColorScheme.dark(
          primary: ColorsManager.primaryColor,
          secondary: ColorsManager.primaryColor,
        )
            .copyWith(surface: const Color(0xFF191A26))
            .copyWith(error: const Color(0xFFdd3135)),
        popupMenuTheme: const PopupMenuThemeData(
            color: Color(0xFF29292D), surfaceTintColor: Color(0xFF29292D)),
        dialogTheme: const DialogTheme(surfaceTintColor: Colors.white10),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(500))),
        bottomAppBarTheme: const BottomAppBarTheme(
          surfaceTintColor: Colors.black,
          height: 60,
          padding: EdgeInsets.symmetric(vertical: 5),
        ),
        dividerTheme:
            const DividerThemeData(thickness: 0.5, color: Color(0xFFA0A4A8)),
        tabBarTheme: const TabBarTheme(dividerColor: Colors.transparent),
      );
}
