import 'package:flutter/material.dart';
import '../../../models/on_boarding_model.dart';
import '../../../shared/styles/colors.dart';

Widget buildOnBoardingItem(OnBoardingModel onBoarding, BuildContext context) {
  final double screenHeight = MediaQuery.of(context).size.height;
  final double screenWidth = MediaQuery.of(context).size.width;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        "${onBoarding.title}",
        style: TextStyle(
          fontSize: screenWidth * 0.06, // adjust font size based on screen width
          fontWeight: FontWeight.w700,
          color: AppColor.black,
          fontFamily: 'Jannah',
        ),
      ),
      SizedBox(height: screenHeight * 0.05), // adjust height based on screen height
      Image(
        image: AssetImage("${onBoarding.image}"),
        width: screenWidth * 0.6, // adjust width based on screen width
        height: screenHeight * 0.3,
        fit: BoxFit.fill,// adjust height based on screen height

      ),
      SizedBox(height: screenHeight * 0.04), // adjust height based on screen height
      Container(
        width: screenWidth * 0.8, // adjust width based on screen width
        alignment: Alignment.center,
        child: Text(
          "${onBoarding.body}",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: screenWidth * 0.04, // adjust font size based on screen width
          ),
        ),
      ),
    ],
  );
}