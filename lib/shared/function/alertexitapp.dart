import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/colors.dart';
Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "alert",
      titleStyle:const  TextStyle(color: AppColor.defaultColor , fontWeight: FontWeight.bold),
      middleText: "Do you want to exit the application",
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(AppColor.defaultColor)),
            onPressed: () {
              exit(0);
            },
            child:const Text("Exit")),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(AppColor.defaultColor)),
            onPressed: () {
              Get.back();
            },
            child:const Text("cancel"))
      ]);
  return Future.value(true);
}