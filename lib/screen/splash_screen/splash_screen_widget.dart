import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahabharat/screen/splash_screen/splash_screen_controller.dart';
import 'package:mahabharat/utils/asset_res.dart';
import 'package:shadowed_image/shadowed_image.dart';

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
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(color: Colors.white, blurRadius: 7)
                ],
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.orangeAccent, width: 7),
                image: const DecorationImage(
                    image: AssetImage(AssetRes.splashImage),
                    fit: BoxFit.cover)),
          ),
          GetBuilder<SplashScreenController>(
            builder: (controller) {
              return ShadowedImage(
                image: Image.asset(
                  AssetRes.splashTextImage,
                  scale: 2,
                ),
              );
            },
          ),
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
