import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../core/res/constant/app_colors.dart';
import '../../../core/res/theme/app_text_style.dart';
import '../../all_surah/views/all_surah_view.dart';
import '../../search_verses/views/search_verses_view.dart';
import '../controllers/main_screen_controller.dart';

class MainScreenView extends GetView<MainScreenController> {
  const MainScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          body: IndexedStack(
            index: controller.tabIndex.value,
            children: const [
              SearchVersesView(),
              AllSurahView(),
            ],
          ),
          bottomNavigationBar: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.background,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: BottomNavItem(
                      onTap: () => controller.tabIndex.value = 0,
                      icon: Ionicons.search,
                      title: "Cari Ayat",
                      isSelected: controller.tabIndex.value == 0,
                    ),
                  ),
                  Expanded(
                    child: BottomNavItem(
                      onTap: () => controller.tabIndex.value = 1,
                      icon: Ionicons.book_outline,
                      title: "Semua Surah",
                      isSelected: controller.tabIndex.value == 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final void Function()? onTap;
  const BottomNavItem({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? AppColors.primary : AppColors.grey,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? AppColors.primary : AppColors.grey,
                  fontWeight: isSelected ? semiBold : regular,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
