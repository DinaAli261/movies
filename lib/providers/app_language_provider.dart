import 'package:flutter/material.dart';

import '../utils/shared_preferences_helper.dart';

class AppLanguageProvider extends ChangeNotifier {
  String appLanguage = "en";

  AppLanguageProvider() {
    getLang();
  }

  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
  }

  void getLang() async {
    String lang = await getLastLang();
    appLanguage = lang;
    notifyListeners();
  }
}
