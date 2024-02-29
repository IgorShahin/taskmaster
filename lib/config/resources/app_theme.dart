import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightThemeDefault = ThemeData(
    fontFamily: "SF-Pro-Display",
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    appBarTheme: appBarTheme,
    // useMaterial3: false,
  );

  static AppBarTheme appBarTheme = const AppBarTheme(
    color: Colors.transparent,
    iconTheme: IconThemeData(color: Color(0xFF000000)),
  );
}
