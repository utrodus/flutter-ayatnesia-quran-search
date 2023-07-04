import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../datasource/model/filter_model.dart';
import '../datasource/model/search_verse_result_model.dart';
import '../datasource/remote/search_verse_remote_datasource.dart';
import 'package:flutter/services.dart';

class SearchVersesController extends GetxController
    with StateMixin<SearchVerseResultModel> {
  TextEditingController searchTextFieldController = TextEditingController();
  SearchVerseRemoteDataSource searchVerseRemoteDataSource =
      SearchVerseRemoteDataSource();
  FocusNode searchFocusNode = FocusNode();
  late RxString searchQuery = ''.obs;
  final RxBool showBackToTopButton = false.obs;

  void onTapClearSearchTextField() {
    searchTextFieldController.clear();
    searchQuery.value = '';
    searchFocusNode.requestFocus();
    change(SearchVerseResultModel(executionTime: 0.0, results: []),
        status: RxStatus.success());
  }

  void onChangedSearchTextField(String value) {
    searchQuery.value = value;
  }

  void onFieldSubmittedSearchTextField() {
    if (searchQuery.value.isNotEmpty) {
      searchFocusNode.unfocus();
      searchVerse();
    }
  }

  List<FilterModel> listSorted = [
    FilterModel(
        name: 'Relevansi Terkecil', value: 'smallest', isSelected: false),
    FilterModel(name: 'Relevansi Terbesar', value: 'biggest', isSelected: true),
  ];

  onTapSortRelevance(FilterModel filterModel) {
    for (var element in listSorted) {
      if (element.value == filterModel.value) {
        element.isSelected = true;
      } else {
        element.isSelected = false;
      }
    }
    update();
  }

  List<FilterModel> listMethods = [
    FilterModel(
        name: 'Lexical & Semantik', value: 'combination', isSelected: true),
    FilterModel(name: 'Leksikal', value: 'lexical', isSelected: false),
    FilterModel(name: 'Semantik', value: 'semantic', isSelected: false),
  ];

  onTapMethod(FilterModel filterModel) {
    for (var element in listMethods) {
      if (element.value == filterModel.value) {
        element.isSelected = true;
      } else {
        element.isSelected = false;
      }
    }
    update();
  }

  List<FilterModel> listTopRelevance = [
    FilterModel(name: '5 Nilai Tertinggi', value: '5', isSelected: false),
    FilterModel(name: '10 Nilai Tertinggi', value: '10', isSelected: false),
    FilterModel(name: '15 Nilai Tertinggi', value: '15', isSelected: true),
    FilterModel(name: 'Tampilkan Semua', value: 'all', isSelected: false),
  ];

  onTapTopRelevance(FilterModel filterModel) {
    for (var element in listTopRelevance) {
      if (element.value == filterModel.value) {
        element.isSelected = true;
      } else {
        element.isSelected = false;
      }
    }
    update();
  }

  Future<void> searchVerse() async {
    change(null, status: RxStatus.loading());

    var selectedListMethod =
        listMethods.firstWhere((element) => element.isSelected == true).value;

    var selectedListTopRelevance = listTopRelevance
        .firstWhere((element) => element.isSelected == true)
        .value;
    var result = await searchVerseRemoteDataSource.searchVerse(
      query: searchQuery.value,
      measureType: selectedListMethod,
      topRelevance: selectedListTopRelevance,
    );
    var selectedListSorted =
        listSorted.firstWhere((element) => element.isSelected == true).value;
    result.fold(
      (failure) => change(null, status: RxStatus.error(failure)),
      (response) {
        if (response.results!.isNotEmpty) {
          if (selectedListSorted == 'smallest') {
            response.results!
                .sort((a, b) => a.similarity!.compareTo(b.similarity!));
          } else {
            response.results!
                .sort((a, b) => b.similarity!.compareTo(a.similarity!));
          }
          change(response, status: RxStatus.success());
        } else {
          change(SearchVerseResultModel(executionTime: 0.0, results: []),
              status: RxStatus.empty());
        }
      },
    );
  }

  void copyVerses({
    required String arabic,
    required String translation,
    required String tafsir,
    required String surahName,
    required num surahId,
    required num numberInSurah,
  }) {
    String textToCopy =
        'Allah Subhanahu wa Ta\'ala berfirman:\n\n$arabic\n\n$translation\n\n$surahName [$surahId]:$numberInSurah\n\nTafsir Ringkas Kemenag:\n$tafsir\n\nDisalin dari: AyatNesia dan data berasal dari: https://quran.kemenag.go.id/';
    Clipboard.setData(ClipboardData(text: textToCopy));
  }

  // scroll controller
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    change(SearchVerseResultModel(executionTime: 0.0, results: []),
        status: RxStatus.success());

    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.offset >= 400) {
          showBackToTopButton.value = true; // show the back-to-top button
        } else {
          showBackToTopButton.value = false; // hide the back-to-top button
        }
      });
  }

  // This function is triggered when the user presses the back-to-top button
  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 400), curve: Curves.linear);
  }
}
