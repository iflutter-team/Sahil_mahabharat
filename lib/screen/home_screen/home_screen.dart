import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:mahabharat/screen/home_screen/drawer_home_screen.dart';
import 'package:mahabharat/screen/home_screen/home_screen_controller.dart';
import 'package:mahabharat/utils/asset_res.dart';

import '../../services/rate_app_service/rate_app.dart';
import 'home_screen_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    Get.put(RateAppController());
    return SafeArea(
        child: GetBuilder<HomeScreenController>(
      id: "user",
      builder: (controller) {
        return AdvancedDrawer(
          backdrop: Container(
            width: Get.width,
            height: Get.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AssetRes.bgImage), fit: BoxFit.fill)),
          ),
          controller: controller.advancedDrawerController,
          animationCurve: Curves.ease,
          animationDuration: const Duration(seconds: 1),
          animateChildDecoration: true,
          rtlOpening: false,
          disabledGestures: false,
          childDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          drawer: drawerHomePage(),
          child: Scaffold(
            appBar: homeScreenAppBar,
            body: homeScreenBody(),
          ),
        );
      },
    ));
  }
}
