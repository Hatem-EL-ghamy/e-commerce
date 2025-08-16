import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget smallScreen;
  final Widget mediumScreen;
  final Widget largeScreen;

  const Responsive({super.key,
    required this.smallScreen,
    required this.mediumScreen,
    required this.largeScreen,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    if (screenSize.width < 600) {
      return smallScreen;
    } else if (screenSize.width >= 600 && screenSize.width < 1200) {
      return mediumScreen;
    } else {
      return largeScreen;
    }
  }

}

