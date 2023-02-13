import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quran_finder/app/data/models/quran_model.dart';
import 'package:quran_finder/app/data/repository/quran_repository.dart';
import 'package:quran_finder/app/utils/app_response.dart';

class AllSurahController extends GetxController {
  late QuranRepository quranRepo;
  // scroll controller
  late ScrollController scrollController;
  late Rx<AppResponse<List<QuranModel>>> quranResponse =
      Rx<AppResponse<List<QuranModel>>>(
    AppResponse.initial(),
  );
  final RxBool showBackToTopButton = false.obs;

  AllSurahController(QuranRepository quranRepository) {
    quranRepo = quranRepository;
    getAllSurah();
  }
  TextEditingController searchSurahTextFieldController =
      TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  late RxString searchSurahQuery = ''.obs;

  void onTapClearSearchTextField() {
    searchSurahTextFieldController.clear();
    searchSurahQuery.value = '';
    searchFocusNode.requestFocus();
    getAllSurah();
  }

  void onChangedSearchTextField(String value) {
    searchSurahQuery.value = value;
  }

  void onFieldSubmittedSearchTextField() {
    if (searchSurahQuery.value.isNotEmpty) {
      searchFocusNode.unfocus();
      searchSurahName();
    }
  }

  Future getAllSurah() async {
    quranResponse.value = AppResponse.loading();
    try {
      final quran = await quranRepo.getQuranData();
      quranResponse.value = AppResponse.success(data: quran.data);
    } catch (e) {
      quranResponse.value = AppResponse.error(message: e.toString());
    }
  }

  Future searchSurahName() async {
    // search surah name
    quranResponse.value = AppResponse.loading();
    try {
      final quran = await quranRepo.searchSurahName(
        query: searchSurahQuery.value,
      );
      quranResponse.value = AppResponse.success(data: quran.data);
    } catch (e) {
      quranResponse.value = AppResponse.error(message: e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController()
      ..addListener(
        () {
          if (scrollController.offset >= 400) {
            showBackToTopButton.value = true;
          } else {
            showBackToTopButton.value = false;
          }
        },
      );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    searchSurahTextFieldController.dispose();
  }

  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 400), curve: Curves.linear);
  }
}
