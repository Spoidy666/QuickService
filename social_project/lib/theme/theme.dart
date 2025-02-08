import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        surface: Colors.white,
        primary: Colors.grey.shade400,
        secondary: Colors.white,
        tertiary: Colors.black));
ThemeData darkmode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      surface: Colors.grey.shade900,
      primary: Colors.black,
      secondary: Colors.black,
      tertiary: Colors.white,
    ));
