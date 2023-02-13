import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailSurahController extends GetxController {
  final RxBool showBackToTopButton = false.obs;

  // scroll controller
  late ScrollController scrollController;
  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.offset >= 400) {
          showBackToTopButton.value = true; // show the back-to-top button
        } else {
          showBackToTopButton.value = false; // hide the back-to-top button
        }
      });
  }

  @override
  void dispose() {
    scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  // This function is triggered when the user presses the back-to-top button
  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 400), curve: Curves.linear);
  }
}
