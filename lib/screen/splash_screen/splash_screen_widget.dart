import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahabharat/screen/splash_screen/splash_screen_controller.dart';
import 'package:mahabharat/utils/asset_res.dart';
import 'package:mahabharat/utils/color_res.dart';

Widget splashScreenBody() {
  return Container(
    height: Get.height,
    width: Get.width,
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetRes.bgImage), fit: BoxFit.cover)),
    child: Padding(
      padding: EdgeInsets.only(top: Get.height * 0.20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: Get.height * 0.24,
            width: Get.width * 0.60,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(color: ColorRes.blackColor, blurRadius: 0.1)
                ],
                borderRadius:
                    BorderRadius.all(Radius.circular(Get.height * 0.025)),
                border: Border.all(color: ColorRes.orangeAssentColor, width: 5),
                image: const DecorationImage(
                    image: AssetImage(AssetRes.splashImage),
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover)),
          ),
          SizedBox(height: Get.height * 0.020),
          Image.asset(AssetRes.splashTextImage),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: Get.height * 0.10),
            child: wheel(),
          ),
        ],
      ),
    ),
  );
}

///--------------------------------Wheel Animation-----------------------------///
Widget wheel() {
  return GetBuilder<SplashScreenController>(
    id: "ani",
    builder: (controller) {
      return RotationTransition(
        turns: controller.tween.animate(controller.controller),
        child: Image.asset(
          AssetRes.rathWheel,
          scale: Get.height * 0.0070,
        ),
      );
    },
  );
}
