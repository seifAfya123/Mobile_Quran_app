import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en'; // Todo:read this value from sharedpreferences
  ThemeMode themeMode =
      ThemeMode.light; // Todo:read this value from sharedprefences
  void changeLanguage(String newLanguage) {
    if (newLanguage == appLanguage) return;
    appLanguage = newLanguage;
    //Todo:save language to sharedpreferences
    notifyListeners();
  }

  String getSelectedLanguageText() {
    if (appLanguage == 'en') return 'English';
    return 'العربيه';
  }

  void changeTheme(ThemeMode mode) {
    if (mode == themeMode) return;
    themeMode = mode;
    // Todo:save theme in sharedprefences
    notifyListeners();
  }
}
