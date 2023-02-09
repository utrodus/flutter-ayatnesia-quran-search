import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_finder/app/res/theme/app_theme.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Qur'an Finder",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: appTheme,
    ),
  );
}
