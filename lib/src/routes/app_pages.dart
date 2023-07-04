import 'package:get/get.dart';

import '../features/all_surah/views/all_surah_view.dart';
import '../features/detail_surah/bindings/detail_surah_binding.dart';
import '../features/detail_surah/views/detail_surah_view.dart';
import '../features/search_verses/views/search_verses_view.dart';
import '../features/main_screen/bindings/main_screen_binding.dart';
import '../features/main_screen/views/main_screen_view.dart';
import '../features/onboard/bindings/onboard_binding.dart';
import '../features/onboard/views/onboard_view.dart';
import '../core/utils/prefs_manager.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String initial =
      PrefsManager.isFirstTime ? Routes.onboard : Routes.mainScreen;

  static final routes = [
    GetPage(
      name: _Paths.onboard,
      page: () => const OnboardView(),
      binding: OnboardBinding(),
      transition: Transition.circularReveal,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: _Paths.searchVerses,
      page: () => const SearchVersesView(),
    ),
    GetPage(
      name: _Paths.detailSurah,
      page: () => const DetailSurahView(),
      binding: DetailSurahBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(
        milliseconds: 300,
      ),
    ),
    GetPage(
      name: _Paths.mainScreen,
      page: () => const MainScreenView(),
      binding: MainScreenBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(
        milliseconds: 300,
      ),
    ),
    GetPage(
      name: _Paths.allSurah,
      page: () => const AllSurahView(),
    ),
  ];
}
