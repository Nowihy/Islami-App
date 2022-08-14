import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLang = 'En';

  ThemeMode currentTheme = ThemeMode.light;

  void changeTheme(ThemeMode newTheme) async {
    final prefs = await SharedPreferences.getInstance();

    if (newTheme == currentTheme) {
      return;
    }
    currentTheme = newTheme;
    prefs.setString(
        'theme', currentTheme == ThemeMode.light ? 'light' : 'dark');
    notifyListeners();
  }

  void changeLanguage(String newLang) async {
    final prefs = await SharedPreferences.getInstance();
    if (currentLang == newLang) {
      return;
    }
    currentLang = newLang;
    prefs.setString('lang', currentLang);
    notifyListeners();
  }

  bool isDarkMode() {
    return currentTheme == ThemeMode.dark;
  }

  String getMainBackGround() {
    return isDarkMode()
        ? 'assets/images/dark_back_ground.png'
        : 'assets/images/background.png';
  }
}
