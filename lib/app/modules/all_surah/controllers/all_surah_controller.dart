import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quran_finder/app/data/models/quran_model.dart';
import 'package:quran_finder/app/data/repository/quran_repository.dart';
import 'package:quran_finder/app/utils/app_response.dart';

class AllSurahController extends GetxController {
  late QuranRepository quranRepo;

  late Rx<AppResponse<List<QuranModel>>> quranResponse =
      Rx<AppResponse<List<QuranModel>>>(
    AppResponse.initial(),
  );

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
  }

  void onChangedSearchTextField(String value) {
    searchSurahQuery.value = value;
  }

  void onFieldSubmittedSearchTextField() {
    if (searchSurahQuery.value.isNotEmpty) {
      searchFocusNode.unfocus();
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

  @override
  void onClose() {
    super.onClose();
    searchSurahTextFieldController.dispose();
  }
}
