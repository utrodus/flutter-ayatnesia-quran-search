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
}
