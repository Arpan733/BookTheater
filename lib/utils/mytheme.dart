import 'package:flutter/material.dart';

class Mytheme {
  static const Color splash = Color(0xFF2274A5);
  static const Color appbarColor = Color(0xFF222539);
  static const Color statusBarColor = Color(0xFF2E3147);

  static const Color greyColor = Color(0xFFF4F4F4);
  static const Color orangeColor = Color(0xFFEB8D2F);

  static const Color redLight = Color(0xFFFFF1F0);
  static const Color redBorder = Color(0xFFF14336);
  static const Color redTextColor = Color(0xFFD05045);
  static const redGiftGradientColors = [
    Color(0xFFFCCAC6),
    Color(0xFFD05449),
  ];

  static const Color blueLight = Color(0xFFF5F9FF);
  static const Color blueBorder = Color(0xFF3164CE);

  static const Color greenColor = Color(0xFF2EC492);
  static const Color greenTextColor = Color(0xFF8CC153);
  static const greenGiftGradientColors = [
    Color(0xFF89D980),
    Color(0xFF34BA25),
  ];

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
