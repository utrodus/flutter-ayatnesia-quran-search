import 'package:ayat_nesia/src/core/dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'src/core/res/theme/app_theme.dart';
import 'src/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  DependencyInjection.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (context, _) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "AyatNesia",
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
        theme: appTheme,
      ),
    ),
  );
}
