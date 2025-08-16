import 'package:flutter/cupertino.dart';

Widget titleHome(String title,BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Text(
      title,
      style: TextStyle(
        fontSize: MediaQuery.of(context).size.width * 0.06,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}