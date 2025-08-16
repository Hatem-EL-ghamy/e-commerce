import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textButton;
  final IconData iconData;
  final bool? active;
  final double iconSize;
  final double textSize;
  const CustomButtonAppBar({
    Key? key,
    required this.textButton,
    required this.iconData,
    required this.onPressed,
    required this.active,
    required this.iconSize,
    required this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            size: iconSize,
            color: active == true ? AppColor.defaultColor : AppColor.gray1,
          ),
          SizedBox(
            height: textSize * 1.5,
            child: Text(
              textButton,
              style: TextStyle(
                fontSize: textSize,
                color: active == true ? AppColor.defaultColor : AppColor.gray1,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}