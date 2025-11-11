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
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: AppColors.transparent
      )
  );
}
