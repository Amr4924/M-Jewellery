import 'package:flutter/material.dart';

class AppColors {
  static const Color lightGreen = Color(0xFF0A2F1D);
  static const Color lightGold = Color(0xFFC5A059);
  static const Color lightBackgroundScreen = Color.fromARGB(255, 239, 235, 235);

  static const Color darkGreen = Color(0xFF0A2F1D);
  static const Color darkGold = Color.fromARGB(255, 207, 204, 198);
  static const Color darkBackgroundScreen = Color.fromARGB(255, 239, 235, 235);
}

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.lightGreen,
    primaryColorDark: AppColors.lightGreen,
    scaffoldBackgroundColor: AppColors.lightBackgroundScreen,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightGreen,
      foregroundColor: AppColors.lightGold,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightGreen,
      selectedItemColor: AppColors.lightGold,
      unselectedItemColor: Colors.white,
    ),

    colorScheme: const ColorScheme.light(
      primary: AppColors.lightGreen,
      background: AppColors.lightBackgroundScreen,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(color: AppColors.lightGold),
      titleLarge: TextStyle(color: AppColors.lightGold),
      bodyLarge: TextStyle(color: AppColors.lightGold),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.darkGreen,
    primaryColorDark: AppColors.darkGreen,
    scaffoldBackgroundColor: AppColors.darkBackgroundScreen,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkGreen,
      foregroundColor: AppColors.darkGold,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkGreen,
      selectedItemColor: AppColors.darkGold,
      unselectedItemColor: Colors.white,
    ),

    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkGreen,
      background: AppColors.darkBackgroundScreen,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(color: AppColors.darkGold),
      titleLarge: TextStyle(color: AppColors.darkGold),
      bodyLarge: TextStyle(color: AppColors.darkGold),
    ),
  );
}
