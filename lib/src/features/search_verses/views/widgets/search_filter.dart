import 'package:flutter/material.dart';
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
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
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
              const SizedBox(height: 10),
              Divider(
                thickness: 4,
                indent: Get.width * 0.45,
                endIndent: Get.width * 0.45,
                color: AppColors.grey.withOpacity(0.3),
              ),
              const SizedBox(height: 15),
              Text(
                "Filter Pencarian",
                style: h5Bold(context),
              ),
              const SizedBox(height: 15),
              Divider(
                thickness: 1,
                indent: 22,
                endIndent: 22,
                color: AppColors.secondary.withOpacity(0.2),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 22,
                  ),
                  child: SizedBox(
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Urutkan Hasil Relevansi Berdasarkan:",
                          style: bodyText2SemiBold(context),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 10,
                          alignment: WrapAlignment.start,
                          children: controller.listSorted
                              .map(
                                (item) => InputChip(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 3,
                                    vertical: 5,
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
                        const SizedBox(height: 20),
                        Text(
                          "Tampilkan Hasil Pencarian Berdasarkan:",
                          style: bodyText2SemiBold(context),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 10,
                          alignment: WrapAlignment.start,
                          children: controller.listTopRelevance
                              .map(
                                (item) => InputChip(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 3,
                                    vertical: 5,
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
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(Get.width * 0.9, 44),
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.25,
                    vertical: 12,
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
              const SizedBox(height: 20),
            ],
          );
        },
      );
    },
    isScrollControlled: true,
    enableDrag: false,
    constraints: BoxConstraints(
      maxHeight: Get.height * 0.57,
    ),
    isDismissible: false,
  );
}
