import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: AppBarThemeData(
        backgroundColor: AppColors.transparent,
        iconTheme: IconThemeData(
            color: AppColors.yellow
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.black,
      unselectedItemColor: AppColors.white,
      selectedItemColor: AppColors.yellow,
    ),
  );
}
