import 'package:get/get.dart';

import '../modules/all_surah/views/all_surah_view.dart';
import '../modules/detail/bindings/detail_binding.dart';
import '../modules/detail/views/detail_view.dart';
import '../modules/search/views/search_view.dart';
import '../modules/main_screen/bindings/main_screen_binding.dart';
import '../modules/main_screen/views/main_screen_view.dart';
import '../modules/onboard/bindings/onboard_binding.dart';
import '../modules/onboard/views/onboard_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.mainScreen;

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
      name: _Paths.search,
      page: () => const SearchView(),
    ),
    GetPage(
      name: _Paths.detail,
      page: () => const DetailView(),
      binding: DetailBinding(),
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
