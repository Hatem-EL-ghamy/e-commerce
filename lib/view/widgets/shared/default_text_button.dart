import 'package:flutter/material.dart';
import '../../../shared/styles/colors.dart';

defaultTextButton({
  required String text,
  required Function() onPressed,
  double fontSize = 16,
  Color color = AppColor.defaultColor,
  required BuildContext context,
}) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  return TextButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(
        fontSize: screenWidth * (fontSize / 375), // adjust font size based on screen width
        fontFamily: "Jannah",
        color: color,
      ),
    ),
  );
}