import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:mahabharat/common_file/home_screen_common/listTile_divider_common.dart';
import 'package:mahabharat/screen/home_screen/home_screen_controller.dart';
import 'package:mahabharat/utils/asset_res.dart';
import 'package:mahabharat/utils/color_res.dart';
import 'package:mahabharat/utils/icon_res.dart';
import 'package:mahabharat/utils/string_res.dart';

///-----------------------------------------------AppBar-----------------------------------///
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
    horizontalSize(Get.width * 0.015)
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
      child: GetBuilder<HomeScreenController>(
        id: "listView",
        builder: (controller) {
          return controller.userVideo == null
              ? Center(
                  child: CircularProgressIndicator(color: ColorRes.whiteColor))
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.userVideo!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.watchVideo(index);
                      },
                      child: Card(
                        shape: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white70),
                          borderRadius: BorderRadius.all(
                            Radius.circular(Get.height * 0.010),
                          ),
                        ),
                        elevation: 20,
                        color: ColorRes.transparentColor.withOpacity(0.1),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ///----------------------------------------------------------thumlain----------------------------------------------------------------///
                            Container(
                              height: Get.height * 0.16,
                              width: Get.width * 0.48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft:
                                      Radius.circular(Get.height * 0.010),
                                  topLeft: Radius.circular(Get.height * 0.010),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      controller.userVideo![index].imageurl!),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),

                            ///-----------------------------------------------------title-------------------------------------------------------------------------///
                            Expanded(
                              child: Container(
                                height: Get.height * 0.16,
                                decoration: BoxDecoration(
                                    color: ColorRes.black54Color,
                                    borderRadius: BorderRadius.only(
                                        topRight:
                                            Radius.circular(Get.height * 0.01),
                                        bottomRight: Radius.circular(
                                            Get.height * 0.01))),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: Get.width * 0.02,
                                      top: Get.height * 0.0075,
                                      right: Get.width * 0.009),
                                  child: Text(
                                    controller.userVideo![index].title!,
                                    style: TextStyle(
                                        color: ColorRes.whiteColor,
                                        fontSize: Get.height * 0.021,
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
      ));
}
