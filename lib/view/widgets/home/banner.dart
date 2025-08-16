import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';

// ignore: non_constant_identifier_names
Widget bannerCard()=>  Container(
  margin: const EdgeInsets.only( top: 16),
  child: Stack(children: [
    Container(
      alignment: Alignment.center,
      height: 150,
      decoration: BoxDecoration(
          color: AppColor.defaultColor,
          borderRadius: BorderRadius.circular(20)),
      child: const ListTile(
        title: Text("A summer surprise"  , style: TextStyle(color:AppColor.white , fontSize: 20)),
        subtitle: Text("Cashback 20%"  , style: TextStyle(color: AppColor.white , fontSize: 25,fontWeight: FontWeight.w900)),
      ),
    ) ,
    Positioned(
      top: -20,
      right: -20,
      child: Container(height: 160,width: 160,decoration: BoxDecoration(
          color: AppColor.gray1 ,
          borderRadius: BorderRadius.circular(160)
      ),),
    )
  ]),
);