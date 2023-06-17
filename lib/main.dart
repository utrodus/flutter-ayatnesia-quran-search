import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ayat_nesia/app/res/theme/app_theme.dart';
import 'app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "AyatNesia",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: appTheme,
    ),
  );
}
