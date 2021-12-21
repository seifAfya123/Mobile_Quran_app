import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';
  int tasbeh_count = 0; // Todo:read this value from sharedpreferences
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

  // void set_new_tasbeh_count(int _tasbeh_count) {
  //   tasbeh_count = _tasbeh_count;
  //   notifyListeners();
  // }

  void changeTheme(ThemeMode mode) {
    if (mode == themeMode) return;
    themeMode = mode;
    // Todo:save theme in sharedprefences
    notifyListeners();
  }
}
