import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahabharat/common_file/home_screen_common/listTile_divider_common.dart';
import 'package:mahabharat/screen/home_screen/home_screen_controller.dart';
import 'package:mahabharat/screen/setting_screen/setting_screen_controller.dart';
import 'package:mahabharat/services/rate_app_service/rate_app.dart';
import 'package:mahabharat/utils/color_res.dart';
import 'package:mahabharat/utils/icon_res.dart';
import 'package:mahabharat/utils/string_res.dart';

Widget resetSetting() {
  return GetBuilder<SettingScreenController>(
    builder: (controller) {
      return GestureDetector(
        onTap: () => controller.resetSetting(),
        child: textWidgetTitleCommon(StringRes.resetEp),
      );
    },
  );
}

Widget shareSetting() {
  return GetBuilder<HomeScreenController>(
    builder: (controller) {
      return GestureDetector(
        onTap: () => controller.shareLink(),
        child: textWidgetTitleCommon(StringRes.shareFriend),
      );
    },
  );
}

Widget rateAppSetting() {
  return GetBuilder<RateAppController>(
    id: "rateAppSetting",
    builder: (controller) {
      return GestureDetector(
          onTap: () => controller.rateApp(),
          child: textWidgetTitleCommon(StringRes.rateThis));
    },
  );
}

Widget musicOnOff() {
  return GetBuilder<SettingScreenController>(
    id: "box",
    builder: (controller) {
      return IconButton(
          onPressed: () {
            controller.offMusic = !controller.offMusic;
            controller.sound();
          },
          icon: Icon(
            controller.offMusic ? IconRes.boxIcon : IconRes.checkBox,
            color: ColorRes.orangeColor,
          ));
    },
  );
}
