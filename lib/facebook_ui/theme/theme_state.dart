import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeState with ChangeNotifier {
  ThemeData _currentTheme = lightMode;
  bool _darkTheme = false;

  ThemeData get currentTheme => _currentTheme;
  bool get isDarkTheme => _darkTheme;
  set isDarkTheme(bool value) {
    _darkTheme = value;

    if (value) {
      _currentTheme = darkMode;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    } else {
      _currentTheme = lightMode;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
    notifyListeners();
  }
}

final ThemeData darkMode = ThemeData(
  scaffoldBackgroundColor: const Color(0xff070c20),
  backgroundColor: const Color(0xff272d3a),
  buttonColor: const Color(0xff2f3643),
  accentColor: const Color(0xffffffff),
  iconTheme: const IconThemeData(color: Color(0xff515765)),
  dividerColor: const Color(0xff2d3340),
  cardColor: const Color(0xff2e3441),
);

final ThemeData lightMode = ThemeData(
  scaffoldBackgroundColor: const Color(0xfff4f6f8),
  backgroundColor: const Color(0xffffffff),
  buttonColor: const Color(0xfff9fafb),
  accentColor: const Color(0xff364987),
  iconTheme: const IconThemeData(color: Color(0xffd5dcef)),
  dividerColor: const Color(0xfff8f8f8),
  cardColor: const Color(0xffffffff),
);
