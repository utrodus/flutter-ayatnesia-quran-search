import 'package:ayat_nesia/app/data/models/filter_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AppState { initial, loading, success, error }

class SearchVersesController extends GetxController {
  late Rx<AppState> appState;
  SearchVersesController() {
    appState = AppState.initial.obs;
  }
  TextEditingController searchTextFieldController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  late RxString searchQuery = ''.obs;

  void onTapClearSearchTextField() {
    searchTextFieldController.clear();
    searchQuery.value = '';
    searchFocusNode.requestFocus();
  }

  void onChangedSearchTextField(String value) {
    searchQuery.value = value;
  }

  void onFieldSubmittedSearchTextField() {
    if (searchQuery.value.isNotEmpty) {
      searchFocusNode.unfocus();
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
        name: 'Pengukuran Leksikal', value: 'lexical', isSelected: false),
    FilterModel(
        name: 'Pengukuran Semantik', value: 'semantic', isSelected: false),
    FilterModel(
        name: 'Pengukuran Lexical & Semantik',
        value: 'combinations',
        isSelected: true),
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
    FilterModel(name: '15 Nilai Tertinggi', value: '15', isSelected: false),
    FilterModel(name: 'Tampilkan Semua', value: 'all', isSelected: true),
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
}
