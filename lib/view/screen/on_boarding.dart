import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/shared/constants/routes.dart';
import '../../data/local/static.dart';
import '../../shared/services/services.dart';
import '../../shared/styles/colors.dart';
import '../widgets/onboarding/build_onboarding_item.dart';
import '../widgets/shared/default_button.dart';
import '../widgets/shared/default_text_button.dart';
import '../widgets/onboarding/smooth_page_Indicator.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  MyServices myServices = Get.find();

  var boardingController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: PageView.builder(
              onPageChanged: (index) {
                if (index == onBoardingList.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              controller: boardingController,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  buildOnBoardingItem(onBoardingList[index], context),
              itemCount: onBoardingList.length,
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                smoothPageIndicator(boardingController: boardingController),
                const Spacer(),
                defaultButton(
                  text: "Continue",
                  onPressed: () {
                    if (isLast) {
                      myServices.sharedPreferences.setString("step", "1");                      Get.offAllNamed(AppRoute.login);
                    } else {
                      boardingController.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  width: 300,
                ),
                defaultTextButton(
                  text: "Skip",
                  onPressed: () {
                    myServices.sharedPreferences.setString("step", "1");
                    Get.offAllNamed(AppRoute.login);
                  },
                  fontSize: 20,
                  color: AppColor.black, context: context,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}