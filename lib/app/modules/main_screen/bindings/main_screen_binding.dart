import 'package:get/get.dart';
import 'package:quran_finder/app/modules/all_surah/controllers/all_surah_controller.dart';
import 'package:quran_finder/app/modules/search_verses/controllers/search_verses_controller.dart';

import '../controllers/main_screen_controller.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainScreenController());
    Get.put(SearchVersesController());
    Get.put(AllSurahController());
  }
}
