import 'package:flutter/material.dart';

class Mytheme{
  static const Color splash = Color(0xFF2274A5);
  static const Color appbarColor = Color(0xFF222539);

  static const Color greyColor = Color(0xFFF4F4F4);

  static const Color redLight = Color(0xFFFFF1F0);
  static const Color redBorder = Color(0xFFF14336);

  static const Color blueLight = Color(0xFFF5F9FF);
  static const Color blueBorder = Color(0xFF3164CE);

  static final myLightTheme = ThemeData(
    primaryColor: splash,
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    fontFamily: 'poppins',
    buttonTheme: const ButtonThemeData(
      colorScheme: ColorScheme.light(
        background: splash,
        primary: splash,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: appbarColor,
    ),
  );
}