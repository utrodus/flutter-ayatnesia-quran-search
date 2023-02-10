import 'package:flutter/material.dart';
import 'package:quran_finder/app/res/constant/app_colors.dart';
import 'package:quran_finder/app/res/theme/app_text_style.dart';

class CustomButton extends StatelessWidget {
  final BorderRadiusGeometry borderRadius;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final Widget child;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.width,
    this.height = 44.0,
  }) : super(key: key);

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
          "Get Started",
          style: h5Bold(context).copyWith(
            color: AppColors.onPrimary,
            fontWeight: semiBold,
          ),
        )),
      ),
    );
  }
}
