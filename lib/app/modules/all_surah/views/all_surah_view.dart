import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ayat_nesia/app/data/models/quran_model.dart';
import 'package:ayat_nesia/app/res/components/custom_appbar.dart';
import 'package:ayat_nesia/app/routes/app_pages.dart';
import 'package:ayat_nesia/app/utils/app_response.dart';

import '../../../res/constant/app_assets.dart';
import '../../../res/constant/app_colors.dart';
import '../../../res/theme/app_text_style.dart';
import '../controllers/all_surah_controller.dart';
import 'widgets/surah_item.dart';

class AllSurahView extends GetView<AllSurahController> {
  const AllSurahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: "Semua Surah Al Qur'an",
        isHasBackBtn: false,
      ),
      body: ListView(
        controller: controller.scrollController,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          bottom: 18,
        ),
        children: [
          Obx(() => Visibility(
              visible: controller.quranResponse.value.status == Status.loading,
              child: const LinearProgressIndicator())),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
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
                                image: const AssetImage(AppAssets.icBookWhite),
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
                            "Al Qur'an Kemenag RI",
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
            height: 28,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Obx(() {
              switch (controller.quranResponse.value.status) {
                case Status.loading:
                  return Container();
                case Status.success:
                  return AnimationLimiter(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.quranResponse.value.data!.length,
                      itemBuilder: (context, index) {
                        QuranModel surah =
                            controller.quranResponse.value.data![index];
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
                                    arguments: surah,
                                  );
                                },
                                numberSurah: surah.number.toString(),
                                title: surah.name,
                                title2: surah.revelation,
                                subtitle1: surah.translation,
                                subtitle2:
                                    "${surah.numberOfAyahs.toString()} Ayat",
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                case Status.error:
                  return Container();
                default:
                  return Container();
              }
            }),
          )
        ],
      ),
      floatingActionButton: Obx(
        () => Visibility(
          visible: controller.showBackToTopButton.value,
          child: FloatingActionButton(
            onPressed: controller.scrollToTop,
            backgroundColor: AppColors.primary,
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
