import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardAdminHome extends StatelessWidget {

  String url;
  String title;
  void Function()? onTap;


  CardAdminHome({super.key, required this.url, required this.title, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap:onTap,
      child: Card(
        elevation: 10,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(url, width: 100),
              Text(title),
            ]),
      ),
    );
  }
}
