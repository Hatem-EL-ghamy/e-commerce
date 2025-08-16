import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../data/local/static.dart';
import '../../../shared/styles/colors.dart';


Widget smoothPageIndicator({ var boardingController,}){

  return    SmoothPageIndicator(
      effect:  const ExpandingDotsEffect(
        activeDotColor: AppColor.defaultColor,
        dotColor: AppColor.gray1,
        dotHeight: 10,
        expansionFactor: 4,
        dotWidth: 10,
        spacing: 5.0,


      ),
      controller: boardingController,
      count: onBoardingList.length);
}