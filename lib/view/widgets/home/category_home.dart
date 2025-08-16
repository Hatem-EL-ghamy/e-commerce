import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../models/home_model.dart';
import '../../../shared/styles/colors.dart';

class CategoryItem extends GetView<HomeControllerImplement> {
  const CategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: MediaQuery.of(context).size.height / 8,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => BuildCategoryItem(
          i: index,

          categoriesModel:   Categories.fromJson(controller.categories[index]),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
      ),
    );
  }
}


class BuildCategoryItem extends GetView<HomeControllerImplement> {
  const BuildCategoryItem({Key? key, required this.categoriesModel,required this.i}) : super(key: key);
 final Categories categoriesModel;
 final int? i;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.goToItems(controller.categories, i! , categoriesModel.id.toString());
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.29,

        color: AppColor.gray2,
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(
                  imageUrl:
                  "${categoriesModel.image}",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                color: AppColor.black.withOpacity(.7),
                alignment: Alignment.center,
                child: Text(
                  "${categoriesModel.name}",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



