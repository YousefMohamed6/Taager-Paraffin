import 'package:flutter/material.dart';
import 'package:tager_paraffin/core/managers/keys_manager.dart';
import 'package:tager_paraffin/core/managers/secure_storage_service.dart';

class LanguageProvider extends ChangeNotifier {
  Locale locale = Locale('en', 'US');
  bool isArabic = false;
  Future<void> getLocale() async {
    String? languageCode = await SecureStorageManager.storage.read(
      key: KeysManager.kLanguageCode,
    );
    isArabic = languageCode == 'ar';
    locale = Locale(languageCode ?? 'en');
    notifyListeners();
  }

  void setLocale(String language) {
    locale = Locale(language);
    isArabic = language == 'ar';
    notifyListeners();
  }

  Future<void> saveLanguage() async {
    await SecureStorageManager.storage.write(
      key: KeysManager.kLanguageCode,
      value: isArabic ? 'ar' : 'en',
    );
  }
}
