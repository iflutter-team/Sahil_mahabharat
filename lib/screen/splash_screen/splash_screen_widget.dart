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
      padding: EdgeInsets.only(top: Get.height * 0.25),
      child: Column(
        children: [
          Container(
            height: Get.height * 0.20,
            width: Get.width * 0.50,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(color: ColorRes.whiteColor, blurRadius: 5)
                ],
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: ColorRes.orangeAssentColor, width: 7),
                image: const DecorationImage(
                    image: AssetImage(AssetRes.splashImage),
                    fit: BoxFit.cover)),
          ),
          Image.asset(AssetRes.splashTextImage, scale: 1.5),
          const Spacer(),
          Center(
              child: Padding(
            padding: EdgeInsets.only(bottom: Get.height * 0.10),
            child: wheel(),
          )),
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
        child: SizedBox(
          height: Get.height * 0.090,
          child: Image.asset(
            AssetRes.rathWheel,
          ),
        ),
      );
    },
  );
}
