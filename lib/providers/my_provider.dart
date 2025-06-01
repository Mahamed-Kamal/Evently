import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme(ThemeMode newTheme) {
    themeMode = newTheme;
    notifyListeners();
  }
}
