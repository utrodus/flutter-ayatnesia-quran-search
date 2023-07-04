import 'package:ayat_nesia/src/features/all_surah/datasource/model/all_surah_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../datasource/remote/all_surah_remote_datasource.dart';

class AllSurahController extends GetxController
    with StateMixin<List<AllSurahModel>> {
  // scroll controller
  late ScrollController scrollController;
  final RxBool showBackToTopButton = false.obs;
  AllSurahRemoteDataSource allSurahRemoteDataSource =
      AllSurahRemoteDataSource();

  TextEditingController searchSurahTextFieldController =
      TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  late RxString searchSurahQuery = ''.obs;
  List<AllSurahModel> allSurahData = <AllSurahModel>[].obs;
  List<AllSurahModel> resultsSearchByName = <AllSurahModel>[].obs;

  void onTapClearSearchTextField() {
    searchSurahTextFieldController.clear();
    searchSurahQuery.value = '';
    searchFocusNode.requestFocus();
    change(allSurahData, status: RxStatus.success());
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

  Future<void> getAllSurahList() async {
    change(null, status: RxStatus.loading());
    Either<String, List<AllSurahModel>> failureOrSuccess =
        await allSurahRemoteDataSource.getUserList();

    failureOrSuccess.fold(
      (failure) => change(null, status: RxStatus.error(failure)),
      (List<AllSurahModel> response) {
        if (response.isEmpty) {
          change([], status: RxStatus.empty());
        } else {
          allSurahData = response;
          change(response, status: RxStatus.success());
        }
      },
    );
  }

  Future searchSurahName() async {
    if (allSurahData.isNotEmpty) {
      resultsSearchByName = allSurahData.where((element) {
        var surahName = element.name!.toLowerCase();
        return surahName.contains(searchSurahQuery.value.toLowerCase());
      }).toList();
      change(resultsSearchByName, status: RxStatus.success());
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAllSurahList();
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
