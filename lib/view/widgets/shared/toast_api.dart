
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required String msg,
  int time =10,
  required Color backgroundColor,
})=>Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: time,

    backgroundColor: backgroundColor,
    textColor: Colors.white,
    fontSize: 16.0
);