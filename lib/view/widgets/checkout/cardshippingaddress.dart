import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';

class CardShppingAddressCheckout extends StatelessWidget {
  final String title;
  final String body;
  final bool isactive;
  const CardShppingAddressCheckout(
      {Key? key,
        required this.title,
        required this.body,
        required this.isactive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: isactive ? AppColor.defaultColor : AppColor.gray1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(title,
            style: TextStyle(
                color: isactive ? AppColor.white :AppColor.white ,
                fontWeight: FontWeight.bold)),
        subtitle: Text(body,
            style: TextStyle(
                color: isactive ? AppColor.white : AppColor.white,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}