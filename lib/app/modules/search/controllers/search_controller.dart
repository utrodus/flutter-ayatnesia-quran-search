import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SearchStatus { initial, loading, success, error }

class SearchController extends GetxController {
  late Rx<SearchStatus> searchStatus;
  SearchController() {
    searchStatus = SearchStatus.initial.obs;
  }
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  late RxString searchQuery = ''.obs;

  void onTapClearSearchTextField() {
    searchController.clear();
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
