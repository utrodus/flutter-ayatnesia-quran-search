import 'package:flutter/material.dart';
import '../constant/app_colors.dart';

/// Font Family Configs
String get nunito => "Poppins";
String get amiri => "Amiri";

FontWeight get regular => FontWeight.w400;
FontWeight get medium => FontWeight.w500;
FontWeight get semiBold => FontWeight.w600;
FontWeight get bold => FontWeight.w700;
FontWeight get extraBold => FontWeight.w800;

/// Text Theme Configs
TextTheme get textTheme => TextTheme(
      displayLarge: TextStyle(
        color: AppColors.secondary,
        fontSize: 32,
        height: 1.5,
        fontWeight: bold,
      ),
      displayMedium: TextStyle(
        color: AppColors.secondary,
        fontSize: 24,
        height: 1.5,
        fontWeight: bold,
      ),
      displaySmall: TextStyle(
        color: AppColors.secondary,
        fontSize: 20,
        height: 1.5,
        fontWeight: bold,
      ),
      headlineMedium: TextStyle(
        color: AppColors.secondary,
        fontSize: 18,
        height: 1.5,
        fontWeight: bold,
      ),
      headlineSmall: TextStyle(
        color: AppColors.secondary,
        fontSize: 16,
        height: 1.5,
        fontWeight: bold,
      ),
      titleLarge: TextStyle(
        color: AppColors.secondary,
        fontSize: 14,
        height: 1.5,
        fontWeight: bold,
      ),
      titleMedium: TextStyle(
        color: AppColors.secondary,
        fontSize: 12,
        height: 1.5,
        fontWeight: regular,
      ),
      bodyLarge: TextStyle(
        color: AppColors.secondary,
        fontSize: 15,
        height: 1.5,
        fontWeight: regular,
      ),
      bodyMedium: TextStyle(
        color: AppColors.secondary,
        fontSize: 14,
        fontWeight: regular,
      ),
      bodySmall: TextStyle(
        color: AppColors.secondary,
        fontSize: 12,
        fontWeight: regular,
      ),
    );

TextStyle h1Bold(BuildContext context) =>
    Theme.of(context).textTheme.displayLarge!;

TextStyle h2Bold(BuildContext context) =>
    Theme.of(context).textTheme.displayMedium!;

TextStyle h3Bold(BuildContext context) =>
    Theme.of(context).textTheme.displaySmall!;

TextStyle h4Bold(BuildContext context) =>
    Theme.of(context).textTheme.headlineMedium!;

TextStyle h5Bold(BuildContext context) =>
    Theme.of(context).textTheme.headlineSmall!;

TextStyle h6Bold(BuildContext context) =>
    Theme.of(context).textTheme.titleLarge!;

TextStyle arabicH2Bold(BuildContext context) =>
    Theme.of(context).textTheme.displayMedium!.copyWith(
          fontWeight: bold,
          fontFamily: amiri,
        );

TextStyle arabicRegular(BuildContext context) =>
    Theme.of(context).textTheme.displayMedium!.copyWith(
          fontWeight: regular,
          fontFamily: amiri,
        );

TextStyle bodyText1Regular(BuildContext context) =>
    Theme.of(context).textTheme.bodyLarge!;

TextStyle bodyText1Bold(BuildContext context) =>
    Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontWeight: bold,
        );

TextStyle bodyText2Regular(BuildContext context) =>
    Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: AppColors.onSecondary,
        );

TextStyle bodyText2Bold(BuildContext context) =>
    Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: bold);

TextStyle subtitle1Regular(BuildContext context) =>
    Theme.of(context).textTheme.titleMedium!;

TextStyle subtitle1Bold(BuildContext context) =>
    Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: bold);
