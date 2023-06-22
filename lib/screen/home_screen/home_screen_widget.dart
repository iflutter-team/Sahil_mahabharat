import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:mahabharat/screen/home_screen/home_screen_controller.dart';
import 'package:mahabharat/screen/home_screen/video_data.dart';
import 'package:mahabharat/utils/asset_res.dart';
import 'package:mahabharat/utils/color_res.dart';
import 'package:mahabharat/utils/icon_res.dart';
import 'package:mahabharat/utils/string_res.dart';

AppBar homeScreenAppBar = AppBar(
  leading: GetBuilder<HomeScreenController>(
    builder: (controller) {
      return IconButton(
        onPressed: () => controller.handleMenuButtonPressed(),
        icon: ValueListenableBuilder<AdvancedDrawerValue>(
          valueListenable: controller.advancedDrawerController,
          builder: (_, value, __) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: Icon(
                value.visible ? IconRes.clearIcon : IconRes.menuIcon,
                key: ValueKey<bool>(value.visible),
              ),
            );
          },
        ),
      );
    },
  ),
  centerTitle: true,
  backgroundColor: ColorRes.redColor.shade700,
  title: BorderedText(
    strokeWidth: 2,
    strokeColor: ColorRes.orangeAssentColor,
    child: Text(
      StringRes.mahabharatText,
      style: TextStyle(
          fontSize: Get.height * 0.040,
          color: ColorRes.whiteColor,
          fontStyle: FontStyle.italic,
          shadows: const [Shadow(color: ColorRes.blackColor, blurRadius: 6)]),
    ),
  ),
  actions: [
    GetBuilder<HomeScreenController>(
      id: "share",
      builder: (controller) {
        return IconButton(
            onPressed: () => controller.shareLink(),
            icon: const Icon(IconRes.shareIcon));
      },
    ),
    const SizedBox(width: 15)
  ],
);

///-------------------------------------------Home Screen Body Part----------------------------------------///
Widget homeScreenBody() {
  return Container(
    height: Get.height,
    width: Get.width,
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetRes.bgImage), fit: BoxFit.cover)),
    child: ListView.builder(
      itemCount: VideoData.data.length,
      itemBuilder: (context, index) {
        return GetBuilder<HomeScreenController>(
          builder: (controller) {
            return GestureDetector(
              onTap: () {
                controller.watchVideo(index);
              },
              child: Card(
                shape: OutlineInputBorder(
                  borderSide: const BorderSide(color: ColorRes.whiteColor),
                  borderRadius: BorderRadius.all(
                    Radius.circular(Get.height * 0.010),
                  ),
                ),
                elevation: 20,
                color: ColorRes.transparentColor.withOpacity(0.1),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Get.height * 0.18,
                      width: Get.width * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(Get.height * 0.010),
                          topLeft: Radius.circular(Get.height * 0.010),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            VideoData.data[index]["image"],
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: Get.height * 0.18,
                        color: ColorRes.black54Color,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 5, top: 7, right: 5),
                          child: Text(
                            VideoData.data[index]["description"],
                            style: const TextStyle(
                                color: ColorRes.whiteColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    ),
  );
}
