import 'package:flutter/material.dart';

import '../constant/app_colors.dart';
import '../theme/app_text_style.dart';

class CustomButton extends StatelessWidget {
  final BorderRadiusGeometry borderRadius;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final String title;
  final TextStyle? titleStyle;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.width,
    this.height = 44.0,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.primaryGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: borderRadius,
        ),
        child: Center(
            child: Text(
          title,
          style: titleStyle ??
              h5Bold(context).copyWith(
                color: AppColors.onPrimary,
                fontWeight: medium,
              ),
        )),
      ),
    );
  }
}
