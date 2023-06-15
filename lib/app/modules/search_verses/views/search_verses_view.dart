import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:quran_finder/app/res/constant/app_assets.dart';
import 'package:quran_finder/app/res/constant/app_colors.dart';
import 'package:quran_finder/app/res/theme/app_text_style.dart';

import '../controllers/search_verses_controller.dart';

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
                children: [
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: const AssetImage(AppAssets.imgLogo),
                        width: Get.width * 0.08,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "AyatNesia",
                        style: h5Bold(context).copyWith(
                          color: AppColors.onPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Solusi untuk Menemukan Ayat\nAl Qur’an sesuai kebutuhanmu",
                    style: h5Bold(context).copyWith(
                      color: AppColors.onPrimary,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(() => TextFormField(
                        controller: controller.searchTextFieldController,
                        focusNode: controller.searchFocusNode,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Ionicons.search),
                          hintText: "Masukkan kata kunci",
                          hintStyle: bodyText1Regular(context).copyWith(
                            color: AppColors.secondary.withOpacity(0.5),
                          ),
                          suffixIcon: controller.searchQuery.isEmpty
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
                  const Spacer(),
                ],
              ),
            ),
            Obx(() {
              switch (controller.appState.value) {
                case AppState.initial:
                  return Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.13),
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
                case AppState.loading:
                  return Container();
                case AppState.success:
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 16.0,
                    ),
                    child: Column(
                      children: const [
                        Text("Hasil Pencarian Ayat: 0 Ayat"),
                      ],
                    ),
                  );
                case AppState.error:
                  return Container();
                default:
                  return Container();
              }
            })
          ],
        ),
      ),
    );
  }
}
