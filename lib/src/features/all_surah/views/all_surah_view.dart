import 'package:ayat_nesia/src/core/res/constant/app_assets.dart';
import 'package:ayat_nesia/src/features/all_surah/datasource/model/all_surah_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../core/res/constant/app_colors.dart';
import '../../../core/res/theme/app_text_style.dart';
import '../../../routes/app_pages.dart';
import '../controllers/all_surah_controller.dart';
import 'widgets/surah_item.dart';

class AllSurahView extends GetView<AllSurahController> {
  const AllSurahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Semua Surah Al Qur'an",
          style: TextStyle(color: AppColors.onPrimary),
        ),
        centerTitle: true,
      ),
      body: ListView(
        controller: controller.scrollController,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          bottom: 18,
        ),
        children: [
          // Obx(() => Visibility(
          //     visible: controller.quranResponse.value.status == Status.loading,
          //     child: const LinearProgressIndicator())),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Obx(() => TextFormField(
                  controller: controller.searchSurahTextFieldController,
                  focusNode: controller.searchFocusNode,
                  autofocus: false,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Ionicons.search),
                    hintText: "Masukkan nama surah",
                    hintStyle: bodyText1Regular(context).copyWith(
                      color: AppColors.secondary.withOpacity(0.5),
                    ),
                    suffixIcon: controller.searchSurahQuery.isEmpty
                        ? null
                        : GestureDetector(
                            onTap: () => controller.onTapClearSearchTextField(),
                            child: Icon(
                              Icons.close_rounded,
                              size: 20,
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                  ),
                  textInputAction: TextInputAction.search,
                  style: bodyText1Regular(context),
                  onChanged: (value) =>
                      controller.onChangedSearchTextField(value),
                  onFieldSubmitted: (_) =>
                      controller.onFieldSubmittedSearchTextField(),
                )),
          ),
          const SizedBox(
            height: 10,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: controller.obx(
              (state) => AnimationLimiter(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state?.length,
                  itemBuilder: (context, index) {
                    AllSurahModel surah = state![index];

                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 400),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: SurahItem(
                            onTap: () {
                              controller.searchFocusNode.unfocus();
                              Get.toNamed(
                                Routes.detailSurah,
                                arguments: surah.id,
                              );
                            },
                            numberSurah: surah.id.toString(),
                            title: surah.name.toString(),
                            title2: surah.revelation.toString(),
                            subtitle1: surah.translation.toString(),
                            subtitle2: "${surah.numberOfAyahs.toString()} Ayat",
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              onLoading: const Center(
                child: CircularProgressIndicator(),
              ),
              onEmpty: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                  Image(
                    image: const AssetImage(
                      AppAssets.imgEmptySearch,
                    ),
                    width: Get.width * 0.5,
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Center(
                    child: Text(
                      "Surah tidak ditemukan",
                      style: h5Bold(context).copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Obx(
        () => Visibility(
          visible: controller.showBackToTopButton.value,
          child: FloatingActionButton(
            onPressed: controller.scrollToTop,
            backgroundColor: AppColors.darkGreen,
            child: const Icon(
              Icons.arrow_upward,
              color: AppColors.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
