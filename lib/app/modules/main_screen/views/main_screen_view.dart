import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:quran_finder/app/modules/search_verses/views/search_verses_view.dart';

import '../../all_surah/views/all_surah_view.dart';
import '../controllers/main_screen_controller.dart';

class MainScreenView extends GetView<MainScreenController> {
  const MainScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.tabIndex.value,
          children: const [
            SearchVersesView(),
            AllSurahView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Ionicons.search,
              ),
              label: "Cari Ayat",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Ionicons.book_outline,
              ),
              label: "Semua Surah",
            ),
          ],
          currentIndex: controller.tabIndex.value,
          onTap: (index) => controller.onChangeTabIndex(index),
        ),
      ),
    );
  }
}
