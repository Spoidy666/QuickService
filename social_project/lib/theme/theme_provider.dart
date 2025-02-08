import 'package:flutter/material.dart';
import 'package:social_project/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightmode;
  ThemeData get themeData => _themeData;
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightmode) {
      themeData = darkmode;
    } else {
      themeData = lightmode;
    }
  }
}
