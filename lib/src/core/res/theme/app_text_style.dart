import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant/app_colors.dart';

/// Font Family Configs
String get poppins => "Poppins";
String get lpmqIsepMisbah => "LPMQ-IsepMisbah";

FontWeight get regular => FontWeight.w400;
FontWeight get medium => FontWeight.w500;
FontWeight get semiBold => FontWeight.w600;
FontWeight get bold => FontWeight.w700;
FontWeight get extraBold => FontWeight.w800;

/// Text Theme Configs
TextTheme get textTheme => TextTheme(
      displayLarge: TextStyle(
        color: AppColors.secondary,
        fontSize: 32.sp,
        height: 1.5,
        fontWeight: bold,
      ),
      displayMedium: TextStyle(
        color: AppColors.secondary,
        fontSize: 24.sp,
        height: 1.5,
        fontWeight: bold,
      ),
      displaySmall: TextStyle(
        color: AppColors.secondary,
        fontSize: 20.sp,
        height: 1.5,
        fontWeight: bold,
      ),
      headlineMedium: TextStyle(
        color: AppColors.secondary,
        fontSize: 18.sp,
        height: 1.5,
        fontWeight: bold,
      ),
      headlineSmall: TextStyle(
        color: AppColors.secondary,
        fontSize: 16.sp,
        height: 1.5,
        fontWeight: bold,
      ),
      titleLarge: TextStyle(
        color: AppColors.secondary,
        fontSize: 14.sp,
        height: 1.5,
        fontWeight: bold,
      ),
      titleMedium: TextStyle(
        color: AppColors.secondary,
        fontSize: 13.sp,
        height: 1.5,
        fontWeight: regular,
      ),
      bodyLarge: TextStyle(
        color: AppColors.secondary,
        fontSize: 15.sp,
        height: 1.5,
        fontWeight: regular,
      ),
      bodyMedium: TextStyle(
        color: AppColors.secondary,
        fontSize: 14.sp,
        fontWeight: regular,
      ),
      bodySmall: TextStyle(
        color: AppColors.secondary,
        fontSize: 13.sp,
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

TextStyle arabicRegular(BuildContext context) =>
    Theme.of(context).textTheme.displayMedium!.copyWith(
          fontWeight: regular,
          fontFamily: lpmqIsepMisbah,
        );

TextStyle bodyText1Regular(BuildContext context) =>
    Theme.of(context).textTheme.bodyLarge!;

TextStyle bodyText1Bold(BuildContext context) =>
    Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontWeight: bold,
        );
TextStyle bodyText1SemiBold(BuildContext context) =>
    Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontWeight: semiBold,
        );

TextStyle bodyText2Regular(BuildContext context) =>
    Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: AppColors.onSecondary,
        );

TextStyle bodyText2SemiBold(BuildContext context) =>
    Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: semiBold);

TextStyle bodyText2Bold(BuildContext context) =>
    Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: bold);
TextStyle bodyText3SemiBold(BuildContext context) =>
    Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: semiBold);
TextStyle subtitle1Regular(BuildContext context) =>
    Theme.of(context).textTheme.titleMedium!;

TextStyle subtitle1Bold(BuildContext context) =>
    Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: bold);
