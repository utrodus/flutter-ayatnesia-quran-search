import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran_finder/app/data/models/quran_model.dart';
import 'package:quran_finder/app/res/components/verse_item_widget.dart';
import 'package:quran_finder/app/res/constant/app_assets.dart';
import 'package:quran_finder/app/res/constant/app_colors.dart';
import 'package:quran_finder/app/res/theme/app_text_style.dart';

import '../../../res/components/custom_appbar.dart';
import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  final QuranModel surahData = Get.arguments;
  DetailSurahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          title: "${surahData.number} - ${surahData.name}",
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
                      surahData.name,
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
                visible: surahData.number != 9,
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
                itemCount: surahData.ayahs.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final verse = surahData.ayahs[index];
                  return VerseItemWidget(
                    name: surahData.name,
                    number: verse.number.inSurah.toString(),
                    verseArabic: verse.arab,
                    verseTranslation: verse.translation,
                    onPressed: () {
                      Get.generalDialog(
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return Scaffold(
                            appBar: AppBar(
                              title: Text(
                                "Tafsir ${surahData.name} : ${verse.number.inSurah}",
                                style: h5Bold(context),
                              ),
                              centerTitle: true,
                              actions: [
                                IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: AppColors.errorColor,
                                  ),
                                ),
                              ],
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        verse.arab,
                                        style: arabicRegular(context).copyWith(
                                          height: 3,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                    Text(
                                      "Tafsir Wajiz",
                                      style: h6Bold(context).copyWith(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: semiBold,
                                      ),
                                    ),
                                    Text(
                                      verse.tafsir.kemenag.short,
                                      style: bodyText1Regular(context),
                                      textAlign: TextAlign.justify,
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.03,
                                    ),
                                    Text(
                                      "Tafsir Tahlili",
                                      style: h6Bold(context).copyWith(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: semiBold,
                                      ),
                                    ),
                                    Text(
                                      verse.tafsir.kemenag.long,
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
      ),
    );
  }
}
