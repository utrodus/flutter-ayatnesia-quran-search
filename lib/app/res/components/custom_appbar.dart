import 'package:flutter/material.dart';
import 'package:quran_finder/app/res/constant/app_colors.dart';
import 'package:quran_finder/app/res/theme/app_text_style.dart';

PreferredSizeWidget customAppBar({
  required BuildContext context,
  required String title,
  required bool isBackButton,
}) =>
    PreferredSize(
      preferredSize: const Size.fromHeight(46),
      child: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: bodyText1Bold(context).copyWith(
            color: AppColors.onPrimary,
            fontWeight: semiBold,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: AppColors.primaryGradient,
            ),
          ),
        ),
      ),
    );
