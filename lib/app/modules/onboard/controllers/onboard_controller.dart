import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/prefs_manager.dart';

class OnboardController extends GetxController {
  onTapGetStarted() async {
    await PrefsManager.setFirstTime();
    Get.offAllNamed(Routes.mainScreen);
  }
}
