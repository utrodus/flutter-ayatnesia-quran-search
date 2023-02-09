import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constant/app_colors.dart';
import 'app_text_style.dart';

ThemeData get appTheme => ThemeData(
      fontFamily: nunito,
      scaffoldBackgroundColor: AppColors.background,
      indicatorColor: AppColors.secondary,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.light().copyWith(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        onPrimary: AppColors.onPrimary,
        onSecondary: AppColors.onSecondary,
        background: AppColors.background,
        onSurface: AppColors.onSurface,
        error: AppColors.errorColor,
        tertiary: AppColors.grey,
      ),
      textTheme: textTheme,
      elevatedButtonTheme: elevatedButtonThemeData,
      bottomNavigationBarTheme: bottomNavigatonBarThemeData,
      inputDecorationTheme: inputDecorationTheme,
      appBarTheme: appBarThemeData,
    );

AppBarTheme get appBarThemeData => const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColors.primary,
      ),
      centerTitle: true,
      backgroundColor: AppColors.background,
      elevation: 1,
    );

ElevatedButtonThemeData get elevatedButtonThemeData => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        padding: const EdgeInsets.symmetric(
          vertical: 13,
          horizontal: 24,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
      ),
    );

BottomNavigationBarThemeData get bottomNavigatonBarThemeData =>
    const BottomNavigationBarThemeData(
      elevation: 5,
      backgroundColor: AppColors.background,
      unselectedItemColor: AppColors.grey,
      selectedItemColor: AppColors.secondary,
    );

InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      filled: true,
      fillColor: AppColors.background,
      focusColor: AppColors.background,
      hintStyle: textTheme.bodyMedium!.copyWith(
        color: AppColors.primary.withOpacity(0.7),
      ),
      errorStyle: textTheme.bodySmall!.copyWith(
        color: AppColors.errorColor,
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(255, 216, 216, 216),
          width: 1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromARGB(255, 216, 216, 216), width: 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      disabledBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromARGB(255, 216, 216, 216), width: 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromARGB(255, 216, 216, 216), width: 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.errorColor, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.errorColor, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
