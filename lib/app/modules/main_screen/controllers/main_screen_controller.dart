import 'package:get/get.dart';

class MainScreenController extends GetxController {
  var tabIndex = 0.obs;

  void onChangeTabIndex(int index) {
    tabIndex.value = index;
  }
}
