import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/res/constant/app_colors.dart';
import '../../../../core/res/theme/app_text_style.dart';
import '../../controllers/search_verses_controller.dart';

showFilterDialog(
  BuildContext context,
  SearchVersesController controller,
) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.background,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0.r),
      ),
    ),
    useSafeArea: true,
    builder: (context) {
      return GetBuilder<SearchVersesController>(
        init: controller,
        initState: (_) {},
        builder: (_) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10.h),
              Divider(
                thickness: 4,
                indent: Get.width * 0.45,
                endIndent: Get.width * 0.45,
                color: AppColors.grey.withOpacity(0.3),
              ),
              SizedBox(height: 15.h),
              Text(
                "Filter Pencarian",
                style: h5Bold(context),
              ),
              SizedBox(height: 15.h),
              Divider(
                thickness: 1,
                indent: 22,
                endIndent: 22,
                color: AppColors.secondary.withOpacity(0.2),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.h,
                    horizontal: 22.w,
                  ),
                  child: SizedBox(
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Urutkan Hasil Relevansi Berdasarkan:",
                          style: bodyText3SemiBold(context),
                        ),
                        SizedBox(height: 10.h),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 10.r,
                          alignment: WrapAlignment.start,
                          children: controller.listSorted
                              .map(
                                (item) => InputChip(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 3.w,
                                    vertical: 5.h,
                                  ),
                                  selectedColor: AppColors.lightGreen,
                                  labelStyle:
                                      subtitle1Regular(context).copyWith(
                                    fontWeight: medium,
                                    color: item.isSelected
                                        ? AppColors.darkGreen
                                        : AppColors.grey,
                                  ),
                                  label: Text(
                                    item.name,
                                  ),
                                  selected: item.isSelected,
                                  onPressed: () {
                                    controller.onTapSortRelevance(item);
                                  },
                                ),
                              )
                              .toList(),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "Tampilkan Hasil Pencarian Berdasarkan:",
                          style: bodyText3SemiBold(context),
                        ),
                        SizedBox(height: 10.h),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 10.r,
                          alignment: WrapAlignment.start,
                          children: controller.listTopRelevance
                              .map(
                                (item) => InputChip(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 3.w,
                                    vertical: 5.h,
                                  ),
                                  selectedColor: AppColors.lightGreen,
                                  labelStyle:
                                      subtitle1Regular(context).copyWith(
                                    fontWeight: medium,
                                    color: item.isSelected
                                        ? AppColors.darkGreen
                                        : AppColors.grey,
                                  ),
                                  label: Text(
                                    item.name,
                                  ),
                                  selected: item.isSelected,
                                  onPressed: () {
                                    controller.onTapTopRelevance(item);
                                  },
                                ),
                              )
                              .toList(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  minimumSize: Size(0.9.sw, 44.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.25.sw,
                    vertical: 12.h,
                  ),
                ),
                onPressed: () {
                  controller.onFieldSubmittedSearchTextField();
                  Navigator.pop(context);
                },
                child: Text(
                  "Terapkan",
                  style: h5Bold(context).copyWith(
                    color: AppColors.onPrimary,
                    fontWeight: medium,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          );
        },
      );
    },
    isScrollControlled: true,
    enableDrag: true,
    constraints: BoxConstraints(
      maxHeight: 0.57.sh,
    ),
    isDismissible: true,
  );
}
