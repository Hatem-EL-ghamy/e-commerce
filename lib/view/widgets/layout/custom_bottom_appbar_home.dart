import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controller/cart_controller.dart';
import '../../../controller/home_controller.dart';
import '../../../controller/layout_controller.dart';
import 'custom_button_appbar.dart';

class CustomBottomAppBarLayout extends StatelessWidget {
  const CustomBottomAppBarLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double iconSize = MediaQuery.of(context).size.width * 0.05;
    final double textSize = MediaQuery.of(context).size.width * 0.030;

    // HomeController cartController= Get.put(HomeController());


    return GetBuilder<LayoutScreenControllerImplement>(




    builder: (controller) => BottomAppBar(

          shape: const CircularNotchedRectangle(),
          notchMargin: 10,

          child: Row(

            children: [
              ...List.generate(controller.listScreen.length + 1,
                  ((index) {
                    int i = index > 2 ? index - 1 : index;
                    return index == 2
                        ? const Spacer()
                        : CustomButtonAppBar(

                      textButton: controller.bottomAppBar[i]['title'],
                      iconData: controller.bottomAppBar[i]['icon'],
                      onPressed: () {


                        controller.changeScreen(i);


                      },
                      active:
                      controller.currentScreen == i ? true : false,
                      iconSize: iconSize,
                      textSize: textSize,
                    );
                  }))
            ],
          ),
        ));
  }
}
