import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                  SizedBox(height: 50.h),
                  FadeInDown(
                    child: Image(
                      image: const AssetImage(AppAssets.imgLogoGreen),
                      width: 165.w,
                    ),
                  ),
                  SizedBox(height: 25.h),
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
                  SizedBox(height: 50.h),
                  FadeInUpBig(
                    child: Center(
                      child: Image(
                        image: const AssetImage(AppAssets.imgOnboard),
                        width: 0.65.sw,
                      ),
                    ),
                  ),
                  SizedBox(height: 80.h),
                  FadeInUp(
                    child: CustomButton(
                      width: 0.5.sw,
                      height: 51.h,
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
