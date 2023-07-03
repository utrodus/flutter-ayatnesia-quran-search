import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/res/components/custom_button.dart';
import '../../../core/res/constant/app_assets.dart';
import '../../../core/res/constant/app_colors.dart';
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
            return Form(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: Get.height * 0.06),
                        FadeInDown(
                          child: Text(
                            "AyatNesia",
                            style: h2Bold(context).copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 19),
                        FadeInDown(
                          child: Text(
                            "Temukan Ayat Al Qur’an Sesuai\nKebutuhan melalui Fitur Pencarian\nyang kami Sediakan",
                            style: bodyText1Regular(context).copyWith(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 39),
                        FadeInUpBig(
                          child: Center(
                            child: Image(
                              image: const AssetImage(AppAssets.imgOnboard),
                              width: Get.width * 0.8,
                            ),
                          ),
                        ),
                        const Spacer(),
                        FadeInUp(
                          child: CustomButton(
                            width: Get.width * 0.5,
                            height: 51,
                            onPressed: () => controller.onTapGetStarted(),
                            title: "Mulai Sekarang",
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
