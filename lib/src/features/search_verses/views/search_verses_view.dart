import 'package:flutter/material.dart';

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
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 17,
              ),
              width: Get.width,
              height: Get.height * 0.24,
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
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Spacer(),
                  Image(
                    image: const AssetImage(AppAssets.imgLogoWhite),
                    width: Get.width * 0.35,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Pencarian Relevansi Teks Pada\nTerjemahan Ayat Al-Qur'an",
                    style: bodyText2Regular(context).copyWith(
                      color: AppColors.onPrimary,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(height: 15),
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
                                        size: 20,
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
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => showFilterDialog(
                          context,
                          controller,
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          backgroundColor: AppColors.darkGreen,
                          visualDensity: VisualDensity.compact,
                          minimumSize: const Size(
                            0,
                            55,
                          ),
                        ),
                        child: const Icon(
                          Ionicons.options,
                          color: AppColors.background,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 17,
              ),
              child: Text(
                "Pilih Metode Pengukuran Kemiripan:",
                style: bodyText2SemiBold(context),
              ),
            ),
            const SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: 17,
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
                            padding: const EdgeInsets.only(right: 8.0),
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
            controller.obx(
              (searchResults) {
                if (searchResults!.results!.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.10),
                    child: Center(
                        child: Column(
                      children: [
                        Image(
                          image: const AssetImage(
                            AppAssets.imgInitialState,
                          ),
                          width: Get.width * 0.5,
                        ),
                        const SizedBox(height: 21),
                        Text(
                          "Cari Ayat Al Qur’an",
                          style: h5Bold(context).copyWith(
                            fontWeight: semiBold,
                          ),
                        ),
                        const SizedBox(height: 7),
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
                );
              },
              onEmpty: Column(
                children: [
                  SizedBox(height: Get.height * 0.05),
                  Image(
                    image: const AssetImage(
                      AppAssets.imgEmptySearch,
                    ),
                    width: Get.width * 0.4,
                  ),
                  const SizedBox(height: 21),
                  Text(
                    "Ayat Tidak Ditemukan",
                    style: h5Bold(context).copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                    child: const Text(
                      "Hasil pencarian tidak ditemukan, silakan coba dengan kata kunci yang berbeda.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              onLoading: Padding(
                padding: EdgeInsets.only(top: Get.height * 0.05),
                child: Lottie.asset(AppAssets.imageSearchLoading),
              ),
            )
          ],
        ),
      ),
    );
  }
}
