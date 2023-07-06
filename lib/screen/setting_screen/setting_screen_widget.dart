import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:mahabharat/common_file/home_screen_common/listTile_divider_common.dart';
import 'package:mahabharat/common_file/setting_common/row_common.dart';
import 'package:mahabharat/screen/setting_screen/setting_screen_button.dart';
import 'package:mahabharat/screen/setting_screen/setting_screen_controller.dart';
import 'package:mahabharat/utils/asset_res.dart';
import 'package:mahabharat/utils/color_res.dart';
import 'package:mahabharat/utils/icon_res.dart';
import 'package:mahabharat/utils/string_res.dart';

AppBar settingAppBar = AppBar(
  backgroundColor: ColorRes.redColor.shade700,
  leading: GetBuilder<SettingScreenController>(
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
  title: const Text(StringRes.settingText),
  centerTitle: true,
);

Widget settingBody() {
  return Container(
    height: Get.height,
    width: Get.width,
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetRes.bgImage), fit: BoxFit.cover)),
    child: Container(
      height: Get.height,
      width: Get.width,
      color: ColorRes.transparentColor.withOpacity(0.45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: Get.height * 0.020, horizontal: Get.width * 0.020),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidgetTitleCommon(
                    StringRes.applicationText, Get.width * 0.050),
                verticalSize(Get.height * 0.025),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textWidgetTitleCommon(StringRes.playSong),
                        textWidgetSubTitleCommon(StringRes.playSubTitle)
                      ],
                    ),
                    const Spacer(),
                    musicOnOff()
                  ],
                ),
                verticalSize(Get.height * 0.040),
                resetSetting(),
                textWidgetSubTitleCommon(StringRes.resetAll),
                verticalSize(Get.height * 0.010)
              ],
            ),
          ),
          const Divider(color: Colors.grey, thickness: 0.5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.020),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSize(Get.height * 0.010),
                textWidgetTitleCommon(StringRes.otherText, Get.width * 0.050),
                verticalSize(Get.height * 0.025),
                shareSetting(),
                textWidgetSubTitleCommon(StringRes.sendThis),
                verticalSize(Get.height * 0.025),
                rateAppSetting(),
                textWidgetSubTitleCommon(StringRes.rateSub),
                verticalSize(Get.height * 0.025),
                textWidgetTitleCommon(StringRes.moreApp),
                textWidgetSubTitleCommon(StringRes.moreSub),
                verticalSize(Get.height * 0.025),
                textWidgetTitleCommon(StringRes.suggestions),
                textWidgetSubTitleCommon(StringRes.suggestionsSub)
              ],
            ),
          )
        ],
      ),
    ),
  );
}
