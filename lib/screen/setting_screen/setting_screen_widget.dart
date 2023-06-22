import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahabharat/common_file/home_screen_common/listTile_divider_common.dart';
import 'package:mahabharat/screen/setting_screen/setting_screen_button.dart';
import 'package:mahabharat/utils/asset_res.dart';
import 'package:mahabharat/utils/color_res.dart';
import 'package:mahabharat/utils/icon_res.dart';
import 'package:mahabharat/utils/string_res.dart';

import 'setting_screen_controller.dart';

AppBar settingAppBar = AppBar(
  backgroundColor: ColorRes.redColor.shade700,
  leading: GetBuilder<SettingScreenController>(
    builder: (controller) {
      return IconButton(
          onPressed: () => controller.backToDrawer(),
          icon: const Icon(IconRes.menuIcon));
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
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidgetTitleCommon(StringRes.applicationText, 15),
                verticalSize(20),
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
                    music()
                  ],
                ),
                verticalSize(40),
                resetSetting(),
                textWidgetSubTitleCommon(StringRes.resetAll),
                verticalSize(10)
              ],
            ),
          ),
          const Divider(color: Colors.grey, thickness: 0.5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidgetTitleCommon(StringRes.otherText, 15),
                verticalSize(25),
                shareSetting(),
                textWidgetSubTitleCommon(StringRes.sendThis),
                verticalSize(25),
                rateAppSetting(),
                textWidgetSubTitleCommon(StringRes.rateSub),
                verticalSize(25),
                textWidgetTitleCommon(StringRes.moreApp),
                textWidgetSubTitleCommon(StringRes.moreSub),
                verticalSize(25),
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
