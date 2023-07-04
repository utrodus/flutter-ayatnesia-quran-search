import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/app_assets.dart';
import '../constant/app_colors.dart';
import '../theme/app_text_style.dart';

class VerseItemWidget extends StatelessWidget {
  const VerseItemWidget({
    super.key,
    required this.name,
    required this.number,
    required this.verseArabic,
    required this.verseTranslation,
    this.onPressedReadTafsir,
    this.onPressedCopyVerses,
  });

  final String name;
  final String number;
  final String verseArabic;
  final String verseTranslation;
  final void Function()? onPressedReadTafsir;
  final void Function()? onPressedCopyVerses;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$name : $number",
          textAlign: TextAlign.left,
          style: h5Bold(context).copyWith(
            fontWeight: semiBold,
          ),
        ),
        SizedBox(
          height: Get.height * 0.03,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            verseArabic,
            textAlign: TextAlign.right,
            style: arabicRegular(context).copyWith(
              height: 2,
            ),
          ),
        ),
        Text(
          "Artinya:",
          textAlign: TextAlign.left,
          style: h6Bold(context).copyWith(
            fontWeight: regular,
            color: AppColors.errorColor,
          ),
        ),
        Text(
          verseTranslation,
          textAlign: TextAlign.justify,
          style: bodyText1Regular(context),
        ),
        SizedBox(
          height: Get.height * 0.025,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                visualDensity: VisualDensity.compact,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
                side: const BorderSide(
                  color: AppColors.darkGreen,
                  width: 1,
                ),
              ),
              onPressed: onPressedReadTafsir,
              icon: const Image(
                image: AssetImage(
                  AppAssets.icBookWhite,
                ),
                color: AppColors.darkGreen,
                width: 20,
                height: 20,
              ),
              label: Text(
                "Baca Tafsir",
                style: subtitle1Bold(context).copyWith(
                  color: AppColors.darkGreen,
                  fontWeight: semiBold,
                ),
              ),
            ),
            SizedBox(
              width: Get.width * 0.04,
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                visualDensity: VisualDensity.compact,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
                side: const BorderSide(
                  color: AppColors.grey,
                  width: 1,
                ),
              ),
              onPressed: onPressedCopyVerses,
              icon: const Icon(
                Icons.copy,
                color: AppColors.grey,
                size: 18,
              ),
              label: Text(
                "Salin Ayat",
                style: subtitle1Bold(context).copyWith(
                  color: AppColors.grey,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: Get.height * 0.02,
        ),
        Divider(
          color: AppColors.grey.withOpacity(0.3),
          thickness: 1,
        ),
        SizedBox(
          height: Get.height * 0.03,
        ),
      ],
    );
  }
}
