import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/search_product.dart';
import '../../../shared/styles/colors.dart';

class TopProductPageDetailsSearch extends GetView<SearchControllerImplement> {
  const TopProductPageDetailsSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 160,
          decoration:   BoxDecoration(
              color: AppColor.gray3,
            borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30)),

          ),
        ),
        Positioned(
            top: 30.0,
            right: Get.width / 8,
            left: Get.width / 8,
            child: Hero(

              tag: "gg${controller.searchModel.id}",

              child: CachedNetworkImage(
                imageUrl:
                controller.searchModel.image!,
                height: 240,
                // fit: BoxFit.fill,
              ),
            ))
      ],
    );
  }
}