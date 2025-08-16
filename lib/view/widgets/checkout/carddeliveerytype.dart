import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';

class CardDeliveryTypeCheckout extends StatelessWidget {
  final String imageName ;
  final String title  ;
  final bool active   ;
  const CardDeliveryTypeCheckout({Key? key, required this.imageName, required this.title, required this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          color:active  ? AppColor.defaultColor : null ,
          border: Border.all(color: AppColor.defaultColor)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          imageName,
          width: 60,
          color:active ? Colors.white : null ,
        ),
        Text(
          title,
          style: TextStyle(color:active ? Colors.white : AppColor.defaultColor, fontWeight:FontWeight.bold ),
        )
      ]),
    );
  }
}