import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget drawerHomePage() {
  return Drawer(
    child: Column(
      children: [
        Container(
          height: Get.height * 0.20,
          width: double.infinity,
          color: Colors.red.shade700,
          child: Center(
            child: BorderedText(
              strokeWidth: 4.5,
              strokeColor: Colors.orangeAccent,
              child: Text(
                "महाभारत",
                style: TextStyle(
                    fontSize: Get.height * 0.080,
                    color: Colors.green.shade900,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.black87,
          ),
        )
      ],
    ),
  );
}
