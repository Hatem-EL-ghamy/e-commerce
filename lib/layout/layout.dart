import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/shared/constants/routes.dart';
import 'package:store_app_advanced/shared/styles/colors.dart';
import '../controller/cart_controller.dart';
import '../controller/layout_controller.dart';
import '../view/widgets/layout/custom_bottom_appbar_home.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LayoutScreenControllerImplement());

    CartController cartController = Get.put(CartController());

    return GetBuilder<LayoutScreenControllerImplement>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(AppRoute.cart);

              cartController.refreshPage();
            },
            child: const Icon(Icons.shopping_cart_sharp)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: WillPopScope(
            onWillPop: () {
              Get.defaultDialog(
                title: "Warning",
                titleStyle:const TextStyle(fontWeight: FontWeight.w900,color: AppColor.defaultColor) ,
                middleText: "Do you Want To Exit The App",
                onCancel: () {

                },
                 onConfirm: () {
                   exit(0);
                 },
                confirmTextColor: AppColor.white,
              );

              return Future.value(false);
            },
            child: controller.listScreen.elementAt(controller.currentScreen)),
        bottomNavigationBar: const CustomBottomAppBarLayout(),
      );
    });
  }
}
