import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:store_app_advanced/view/screen/category.dart';

import '../view/screen/home.dart';
import '../view/screen/profile.dart';
import '../view/screen/settings.dart';

abstract class LayoutScreenController extends GetxController {
  changeScreen(int index);
}

class LayoutScreenControllerImplement extends LayoutScreenController {
  int currentScreen = 0;

  //
  List<Widget> listScreen = [
    const HomeScreen(),
    const CategoryScreen(),
     const ProfileScreen(),
    SettingsScreen(),
    // const CartScreen(),
  ];



  List bottomAppBar = [
    {"title": "Home", "icon": Icons.home},
    {"title": "Category", "icon": Icons.apps,},
    {"title": "Profile", "icon":  Icons.person,},
    {"title": "settings", "icon": Icons.settings}
  ];


  // List titleBottomAppbar = [
  //   "Home",
  //   "Category",
  //   "Favorite",
  //   "Settings",
  // ];
  //
  // List<IconData> iconBottom = [
  //   Icons.home,
  //   Icons.apps,
  //   Icons.favorite,
  //   Icons.settings,
  // ];

  @override
  // ignore: avoid_renaming_method_parameters
  void changeScreen(int index) {
    currentScreen = index;

    update();
    // onDelete();
  }
}
