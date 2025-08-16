import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';


Widget defaultButton({
  double width = double.infinity,
  Color backGround = AppColor.defaultColor,
  double height = 50,
  required String? text,
  double radius = 10.0,
  bool isUppercase = false,
  required Function() onPressed,


}) =>
    Container(

      decoration: BoxDecoration(
        color: backGround,

        borderRadius: BorderRadius.circular(radius),
      ),
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: onPressed,




        child: Text(
          isUppercase ? text!.toUpperCase() : text!,
          style: const TextStyle(
            color: AppColor.white,
            fontFamily: "Jannah",
            fontSize: 20,
          ),
        ),
      ),
    );
