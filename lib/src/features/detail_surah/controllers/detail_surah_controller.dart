import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../datasource/model/detail_surah_model.dart';
import '../datasource/remote/detail_surah_remote_datasource.dart';

class DetailSurahController extends GetxController
    with StateMixin<DetailSurahModel> {
  DetailSurahRemoteDataSource detailSurahRemoteDataSource =
      DetailSurahRemoteDataSource();

  final num idSurah = Get.arguments;

  Future<void> getDetailSurah() async {
    change(null, status: RxStatus.loading());
    Either<String, DetailSurahModel> failureOrSuccess =
        await detailSurahRemoteDataSource.getDetailSurah(idSurah);

    failureOrSuccess.fold(
      (failure) => change(null, status: RxStatus.error(failure)),
      (DetailSurahModel response) {
        change(response, status: RxStatus.success());
      },
    );
  }

  final RxBool showBackToTopButton = false.obs;

  // scroll controller
  late ScrollController scrollController;
  @override
  void onInit() {
    super.onInit();
    getDetailSurah();
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
