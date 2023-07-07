import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mahabharat/screen/splash_screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const GetMaterialApp(
    // builder: (context, child) => MediaQuery(
    //     data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
    //     child: child!),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}
