import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahabharat/screen/setting_screen/setting_screen_controller.dart';
import 'package:mahabharat/screen/setting_screen/setting_screen_widget.dart';
import 'package:mahabharat/services/rate_app_service/rate_app.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingScreenController());
    Get.lazyPut(() => RateAppController());
    return SafeArea(
        child: Scaffold(appBar: settingAppBar, body: settingBody()));
  }
}
