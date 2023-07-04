import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../core/res/components/custom_appbar.dart';
import '../../../core/res/components/verse_item_widget.dart';
import '../../../core/res/constant/app_assets.dart';
import '../../../core/res/constant/app_colors.dart';
import '../../../core/res/theme/app_text_style.dart';
import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  const DetailSurahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: controller.obx(
        (state) {
          var surahData = state!;
          return Scaffold(
            appBar: customAppBar(
              context: context,
              title: "${surahData.id} - ${surahData.name}",
              isHasBackBtn: true,
            ),
            // This is our back-to-top button
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
            body: SingleChildScrollView(
              controller: controller.scrollController,
              padding: const EdgeInsets.symmetric(
                horizontal: 26,
                vertical: 18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xffECFFF9),
                      border: Border.all(
                        color: const Color(0xffA6E9D4),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Text(
                          surahData.name ?? "-",
                          style: h5Bold(context),
                        ),
                        Text(
                          "(${surahData.translation})",
                          style: h6Bold(context),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                color: AppColors.successColor,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${surahData.revelation};",
                              style: h6Bold(context).copyWith(
                                fontWeight: medium,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${surahData.numberOfAyahs} Ayat",
                              style: h6Bold(context).copyWith(
                                fontWeight: medium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Visibility(
                    visible: surahData.id != 9 && surahData.id != 1,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image(
                            image: const AssetImage(
                              AppAssets.imgBismillahArabic,
                            ),
                            width: Get.width * 0.5,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.04,
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    itemCount: surahData.ayahs!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final verse = surahData.ayahs![index];
                      return VerseItemWidget(
                        name: surahData.name ?? "-",
                        number: verse.numberInSurah.toString(),
                        verseArabic: verse.arabic ?? "-",
                        verseTranslation: verse.translation ?? "-",
                        onPressedCopyVerses: () {
                          controller.copyVerses(
                            surahId: surahData.id!,
                            surahName: surahData.name!,
                            numberInSurah: verse.numberInSurah!,
                            arabic: verse.arabic!,
                            tafsir: verse.tafsir!,
                            translation: verse.translation!,
                          );
                          var snackBar = SnackBar(
                              content: Text(
                                  '${surahData.name!} Ayat ${verse.numberInSurah!} berhasil disalin'));
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
                                    "Tafsir ${surahData.name} : ${verse.numberInSurah}",
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: Get.height * 0.03,
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
                                          height: Get.height * 0.05,
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
                  ),
                ],
              ),
            ),
          );
        },
        onLoading: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
