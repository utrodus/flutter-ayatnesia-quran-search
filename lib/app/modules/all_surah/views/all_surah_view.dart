import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:quran_finder/app/res/components/custom_appbar.dart';

import '../../../res/constant/app_assets.dart';
import '../../../res/constant/app_colors.dart';
import '../../../res/theme/app_text_style.dart';
import '../controllers/all_surah_controller.dart';

class AllSurahView extends GetView<AllSurahController> {
  const AllSurahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: "Semua Surah Al Qur'an",
        isBackButton: false,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 19,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: AppColors.primaryGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image(
                                    image:
                                        const AssetImage(AppAssets.icBookWhite),
                                    width: Get.width * 0.05,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Sumber Data:",
                                    style: h5Bold(context).copyWith(
                                      color: AppColors.onPrimary,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Al Qur'an Kemenag RI,\nTanzil, Al-Quran-ID-API",
                                style: h6Bold(context).copyWith(
                                  color: AppColors.onPrimary,
                                  fontWeight: medium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image(
                          image: const AssetImage(AppAssets.imgLogo),
                          width: Get.width * 0.35,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() => TextFormField(
                    controller: controller.searchSurahTextFieldController,
                    focusNode: controller.searchFocusNode,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Ionicons.search),
                      hintText: "Masukkan nama surah",
                      hintStyle: bodyText1Regular(context).copyWith(
                        color: AppColors.secondary.withOpacity(0.5),
                      ),
                      suffixIcon: controller.searchSurahQuery.isEmpty
                          ? null
                          : GestureDetector(
                              onTap: () =>
                                  controller.onTapClearSearchTextField(),
                              child: Icon(
                                Icons.close_rounded,
                                size: 20,
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                    ),
                    textInputAction: TextInputAction.search,
                    style: bodyText1Bold(context),
                    onChanged: (value) =>
                        controller.onChangedSearchTextField(value),
                    onFieldSubmitted: (_) =>
                        controller.onFieldSubmittedSearchTextField(),
                  )),
            ],
          )),
    );
  }
}
