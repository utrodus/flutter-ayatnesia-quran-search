import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import '../../../core/res/components/verse_item_widget.dart';
import '../../../core/res/constant/app_assets.dart';
import '../../../core/res/constant/app_colors.dart';
import '../../../core/res/theme/app_text_style.dart';
import '../controllers/search_verses_controller.dart';
import 'widgets/search_filter.dart';
import 'package:lottie/lottie.dart';

class SearchVersesView extends GetView<SearchVersesController> {
  const SearchVersesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller.scrollController,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 17.w,
              ),
              height: 0.25.sh,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: AppColors.primaryGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                image: const DecorationImage(
                    image: AssetImage(AppAssets.imgHandWithQuran),
                    fit: BoxFit.contain,
                    alignment: Alignment.bottomRight),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(
                    image: const AssetImage(AppAssets.imgLogoWhite),
                    width: 120.w,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Pencarian Relevansi Teks Pada\nTerjemahan Ayat Al-Qur'an",
                    style: bodyText2SemiBold(context).copyWith(
                      color: AppColors.onPrimary,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(
                          () => TextFormField(
                            controller: controller.searchTextFieldController,
                            focusNode: controller.searchFocusNode,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Ionicons.search),
                              hintText: "Masukkan kata kunci",
                              hintStyle: bodyText2Regular(context).copyWith(
                                color: AppColors.secondary.withOpacity(0.8),
                              ),
                              suffixIcon: controller.searchQuery.isEmpty
                                  ? null
                                  : GestureDetector(
                                      onTap: () => controller
                                          .onTapClearSearchTextField(),
                                      child: Icon(
                                        Icons.close_rounded,
                                        size: 20.r,
                                        color:
                                            Theme.of(context).colorScheme.error,
                                      ),
                                    ),
                            ),
                            textInputAction: TextInputAction.search,
                            style: bodyText2Regular(context),
                            onChanged: (value) =>
                                controller.onChangedSearchTextField(value),
                            onFieldSubmitted: (_) =>
                                controller.onFieldSubmittedSearchTextField(),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      ElevatedButton(
                        onPressed: () => showFilterDialog(
                          context,
                          controller,
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(14.r),
                          backgroundColor: AppColors.darkGreen,
                          visualDensity: VisualDensity.compact,
                          minimumSize: Size(
                            0,
                            60.h,
                          ),
                        ),
                        child: Icon(
                          Ionicons.options,
                          color: AppColors.background,
                          size: 26.r,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 17.w,
              ),
              child: Text(
                "Pilih Metode Pengukuran Kemiripan:",
                style: bodyText2SemiBold(context),
              ),
            ),
            SizedBox(height: 5.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                horizontal: 17.w,
              ),
              physics: const BouncingScrollPhysics(),
              child: GetBuilder<SearchVersesController>(
                init: controller,
                initState: (_) {},
                builder: (_) {
                  return Row(
                    children: controller.listMethods
                        .map(
                          (item) => Padding(
                            padding: EdgeInsets.only(right: 8.0.w),
                            child: InputChip(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 3,
                                vertical: 5,
                              ),
                              selectedColor: AppColors.lightGreen,
                              labelStyle: subtitle1Regular(context).copyWith(
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
                                controller.onTapMethod(item);
                              },
                            ),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            controller.obx((state) {
              if (state!.results!.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                  ),
                  child: Text(
                    "Hasil Pencarian dengan kata kunci: ${controller.searchQuery}, berdasarkan ${controller.selectedTopRelevance.value.name == "Tampilkan Semua" ? "Semua Nilai Tertinggi" : controller.selectedTopRelevance.value.name}",
                    style: bodyText2Regular(context).copyWith(height: 1.6),
                  ),
                );
              }
              return const SizedBox.shrink();
            }, onLoading: const SizedBox.shrink()),
            controller.obx(
              (searchResults) {
                if (searchResults!.results!.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.only(top: 0.10.sh),
                    child: Center(
                        child: Column(
                      children: [
                        Image(
                          image: const AssetImage(
                            AppAssets.imgInitialState,
                          ),
                          width: 0.5.sw,
                        ),
                        SizedBox(height: 21.h),
                        Text(
                          "Cari Ayat Al Qur’an",
                          style: h5Bold(context).copyWith(
                            fontWeight: semiBold,
                          ),
                        ),
                        SizedBox(height: 7.h),
                        const Text(
                          "Masukkan kata kunci untuk\nmencari ayat Al Qur’an",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 15,
                  ),
                  itemCount: searchResults.results!.length,
                  itemBuilder: (context, index) {
                    final verse = searchResults.results![index];
                    return VerseItemWidget(
                      isHasScore: true,
                      similarityScore: verse.similarity ?? 0.0,
                      similarityPercentage: verse.similarityPercentage ?? 0.0,
                      name: verse.suratName ?? "-",
                      number: verse.numberInSurah.toString(),
                      verseArabic: verse.arabic ?? "-",
                      verseTranslation: verse.translation ?? "-",
                      onPressedCopyVerses: () {
                        controller.copyVerses(
                          surahId: verse.surahId!,
                          surahName: verse.suratName!,
                          numberInSurah: verse.numberInSurah!,
                          arabic: verse.arabic!,
                          tafsir: verse.tafsir!,
                          translation: verse.translation!,
                        );
                        var snackBar = SnackBar(
                            content: Text(
                                '${verse.suratName!} Ayat ${verse.numberInSurah!} berhasil disalin'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      onPressedReadTafsir: () {
                        Get.generalDialog(
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) {
                            return Scaffold(
                              appBar: AppBar(
                                title: Text(
                                  "Tafsir ${verse.suratName} : ${verse.numberInSurah}",
                                  style: h5Bold(context).copyWith(
                                    color: AppColors.background,
                                  ),
                                ),
                                centerTitle: true,
                                leading: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: AppColors.background,
                                  ),
                                ),
                              ),
                              body: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: AppColors.background,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          verse.arabic ?? "-",
                                          style:
                                              arabicRegular(context).copyWith(
                                            height: 2,
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Text(
                                        "Tafsir Ringkas Kemenag:",
                                        style: h6Bold(context).copyWith(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: semiBold,
                                        ),
                                      ),
                                      Text(
                                        verse.tafsir ?? "-",
                                        style: bodyText1Regular(context),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                );
              },
              onEmpty: Center(
                child: Column(
                  children: [
                    SizedBox(height: 25.h),
                    Image(
                      image: const AssetImage(
                        AppAssets.imgEmptySearch,
                      ),
                      width: 0.4.sw,
                    ),
                    SizedBox(height: 21.h),
                    Text(
                      "Ayat Tidak Ditemukan",
                      style: h5Bold(context).copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(height: 7.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: const Text(
                        "Hasil pencarian tidak ditemukan,\nSilahkan coba dengan kata kunci yang lain.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              onLoading: Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Lottie.asset(AppAssets.imageSearchLoading),
              ),
            )
          ],
        ),
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
