import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../search_verses/controllers/search_verses_controller.dart';

class AllSurahController extends GetxController {
  AllSurahController() {
    appState = AppState.initial.obs;
  }
  late Rx<AppState> appState;
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
}
