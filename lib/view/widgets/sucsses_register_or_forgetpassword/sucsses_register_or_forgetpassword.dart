import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/shared/constants/routes.dart';

import '../../../shared/styles/colors.dart';
import '../shared/default_button.dart';

Widget success({
  required String text,
}) {
  double screenWidth = MediaQuery.of(Get.context!).size.width;
  double screenHeight = MediaQuery.of(Get.context!).size.height;

  return Container(
    padding: EdgeInsets.all(screenWidth * 0.05),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            Icons.check_circle_outline,
            size: screenWidth * 0.5,
            color: AppColor.defaultColor,
          ),
        ),
        Text(
          "Congratulations",
          style: TextStyle(fontSize: screenWidth * 0.06,fontWeight: FontWeight.w900),
        ),
        Text(
          " $text",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: screenWidth * 0.05),
        ),
        const Spacer(),
        defaultButton(
          text: "Go To Login",
          onPressed: () {
            Get.offAllNamed(AppRoute.login);
          },
        ),
        SizedBox(height: screenHeight * 0.02)
      ],
    ),
  );
}