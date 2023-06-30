import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahabharat/common_file/home_screen_common/listTile_divider_common.dart';
import 'package:mahabharat/screen/home_screen/home_screen_controller.dart';
import 'package:mahabharat/services/rate_app_service/rate_app.dart';
import 'package:mahabharat/utils/icon_res.dart';
import 'package:mahabharat/utils/string_res.dart';

///--------------------------------Video Button-----------------------------------///
Widget videoButton() {
  return GetBuilder<HomeScreenController>(
    id: "videoButton",
    builder: (controller) {
      return GestureDetector(
          onTap: () => controller.videoDrawerButton(),
          child: listTileCommon(IconRes.videoIcon, StringRes.videoText));
    },
  );
}

///------------------------------Setting Button-----------------------------///
Widget settingButton() {
  return GetBuilder<HomeScreenController>(
    builder: (controller) {
      return GestureDetector(
        onTap: () => controller.goToSettingPage(),
        child: listTileCommon(IconRes.settingIcon, StringRes.settingText),
      );
    },
  );
}

///-------------------------------SharApp Button---------------------------///
Widget shareAppButton() {
  return GetBuilder<HomeScreenController>(
    id: 'share',
    builder: (controller) {
      return GestureDetector(
          onTap: () => controller.shareLink(),
          child: listTileCommon(IconRes.shareIcon, StringRes.shareText));
    },
  );
}

///-------------------------------------Rate App Button--------------------------------------///
Widget rateAppButton() {
  return GetBuilder<RateAppController>(
    id: "rateApp",
    builder: (controller) {
      return GestureDetector(
        onTap: () => controller.rateApp(),
        child: listTileCommon(IconRes.rateIcon, StringRes.rateText),
      );
    },
  );
}

///------------------------------------------More App Button-----------------------------///
Widget moreApp() {
  return GetBuilder<RateAppController>(
    id: "moreApp",
    builder: (controller) {
      return GestureDetector(
          onTap: () => controller.moreApp(),
          child: listTileCommon(IconRes.moreIcon, StringRes.moreAppText));
    },
  );
}

Widget characterButton() {
  return GetBuilder<HomeScreenController>(
    builder: (controller) {
      return GestureDetector(
        onTap: () => controller.charactersButton(),
        child: listTileCommon(IconRes.personIcon, StringRes.personText),
      );
    },
  );
}
