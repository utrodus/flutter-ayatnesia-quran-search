import 'package:flutter/material.dart';

import '../../../../core/res/components/custom_border_surah_item.dart';
import '../../../../core/res/constant/app_colors.dart';
import '../../../../core/res/theme/app_text_style.dart';

class SurahItem extends StatelessWidget {
  final String numberSurah;
  final String title;
  final String title2;
  final String subtitle1;
  final String subtitle2;
  final void Function()? onTap;
  const SurahItem({
    super.key,
    required this.onTap,
    required this.numberSurah,
    required this.title,
    required this.title2,
    required this.subtitle1,
    required this.subtitle2,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 7),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        size: const Size(50, 50),
                        painter: CustomBorderSurahItem(),
                      ),
                      Text(
                        numberSurah,
                        style: h6Bold(context).copyWith(fontWeight: semiBold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              title,
                              style: h6Bold(context)
                                  .copyWith(fontWeight: semiBold),
                            ),
                            Expanded(
                              child: Text(
                                title2,
                                style: h6Bold(context).copyWith(
                                  color: AppColors.primary,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              subtitle1,
                              style: subtitle1Regular(context).copyWith(
                                fontWeight: medium,
                                color: AppColors.grey,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: CircleAvatar(
                                radius: 2,
                                backgroundColor:
                                    AppColors.grey.withOpacity(0.4),
                              ),
                            ),
                            Text(
                              subtitle2,
                              style: subtitle1Regular(context).copyWith(
                                fontWeight: medium,
                                color: AppColors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 07),
              Divider(
                color: AppColors.grey.withOpacity(0.3),
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
