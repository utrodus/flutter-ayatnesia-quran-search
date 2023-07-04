import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/res/components/custom_button.dart';
import '../../../core/res/constant/app_assets.dart';
import '../../../core/res/theme/app_text_style.dart';
import '../controllers/onboard_controller.dart';

class OnboardView extends GetView<OnboardController> {
  const OnboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: Get.height * 0.06),
                  FadeInDown(
                    child: Image(
                      image: const AssetImage(AppAssets.imgLogoGreen),
                      width: Get.width * 0.45,
                    ),
                  ),
                  const SizedBox(height: 25),
                  FadeInDown(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "Pencarian Relevansi Teks Terjemahan Ayat\nAl-Qur'an Dengan Pengukuran Kemiripan Leksikal & Semantik",
                        style: bodyText2Regular(context).copyWith(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.05),
                  FadeInUpBig(
                    child: Center(
                      child: Image(
                        image: const AssetImage(AppAssets.imgOnboard),
                        width: Get.width * 0.7,
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.1),
                  FadeInUp(
                    child: CustomButton(
                      width: Get.width * 0.5,
                      height: 51,
                      onPressed: () => controller.onTapGetStarted(),
                      title: "Mulai Sekarang",
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
