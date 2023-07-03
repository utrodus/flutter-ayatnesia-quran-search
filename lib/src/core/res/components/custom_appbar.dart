import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../constant/app_colors.dart';
import '../theme/app_text_style.dart';

PreferredSizeWidget customAppBar({
  required BuildContext context,
  required String title,
  required bool isHasBackBtn,
}) =>
    PreferredSize(
      preferredSize: const Size.fromHeight(46),
      child: AppBar(
        centerTitle: true,
        leading: isHasBackBtn
            ? IconButton(
                icon: const Icon(
                  Ionicons.chevron_back,
                  color: AppColors.onPrimary,
                ),
                onPressed: () => Get.back(),
              )
            : null,
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
