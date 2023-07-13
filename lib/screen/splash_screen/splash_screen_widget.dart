import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahabharat/screen/splash_screen/splash_screen_controller.dart';
import 'package:mahabharat/utils/asset_res.dart';
import 'package:mahabharat/utils/color_res.dart';

///------------------------------------Splash Screen Body-------------------------------------------------------------///
Widget splashScreenBody() {
  double height = Get.height;
  double width = Get.width;
  return Container(
    height: height,
    width: width,
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetRes.bgImage), fit: BoxFit.cover)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ///--------------------------------------------------Splash Screen image-------------------------------------------------------///
        Container(
          height: height * 0.24,
          width: width * 0.70,
          margin: EdgeInsets.only(top: height * 0.22),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(color: ColorRes.blackColor, blurRadius: 0.1)
              ],
              borderRadius: BorderRadius.all(Radius.circular(height * 0.025)),
              border: Border.all(color: ColorRes.orangeAssentColor, width: 5),
              image: const DecorationImage(
                  image: AssetImage(AssetRes.splashImage),
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover)),
        ),
        //SizedBox(height: Get.height * 0.020),
        ///-------------------------------------------------------------Mahabharat Text Image---------------------------------------------///
        Image.asset(AssetRes.splashTextImage),
        const Spacer(),

        ///------------------------------------------------------------Wheel-------------------------------------------------------///
        Padding(
          padding: EdgeInsets.only(bottom: height * 0.10),
          child: wheel(),
        ),
      ],
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
          height: Get.height * 0.12,
          width: Get.width * 0.40,
          child: Image.asset(
            AssetRes.rathWheel,
          ),
        ),
      );
    },
  );
}
