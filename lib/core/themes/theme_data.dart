import 'package:arrive_alive/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 24,
    ),
    iconTheme: IconThemeData(
      color: AppColors.primary,
    ),
  ),
  primaryColor: AppColors.primary, // اللون الرئيسي للعناصر
  hintColor: Colors.orange, // لون التمييز (ممكن تستبدله بـ secondaryColor)
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.grey, // لون الـ BottomNavigationBar
    selectedItemColor: AppColors.primary, // لون العنصر المحدد
    unselectedItemColor: AppColors.myBlack, // لون العناصر غير المحددة
  ),
);

MaterialColor customBlue = const MaterialColor(0xFF007AD0, {
  50: Color(0xFFE3F2FD),
  100: Color(0xFFBBDEFB),
  200: Color(0xFF90CAF9),
  300: Color(0xFF64B5F6),
  400: Color(0xFF42A5F5),
  500: Color(0xFF007AD0), // اللون الأساسي
  600: Color(0xFF0070C0),
  700: Color(0xFF0065B0),
  800: Color(0xFF005AA0),
  900: Color(0xFF004F90),
});
