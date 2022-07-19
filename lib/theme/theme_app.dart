import 'package:sosmed_sample/theme/color.dart';
import 'package:flutter/material.dart';

ThemeData themeLight() {
  return ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      actionsIconTheme: IconThemeData(
        color: AppColors.icon,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: AppColors.tabSelected,
      unselectedLabelColor: AppColors.tabUnSelected,
    ),
    checkboxTheme: const CheckboxThemeData(
      side: BorderSide(color: AppColors.checkboxPrimary),
    ),
  );
}

ThemeData themeDark() {
  return ThemeData.dark();
}
