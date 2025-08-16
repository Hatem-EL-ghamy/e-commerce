import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/view/widgets/shared/responsive.dart';

import '../../../controller/category_controller.dart';
import '../../../models/categories_model.dart';
import '../../../shared/styles/colors.dart';
import '../shared/my_divider.dart';

class ListCategoryItem extends GetView<CategoryControllerImplement> {
  const ListCategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(

        physics: const BouncingScrollPhysics(),

        itemBuilder: (context, index) =>
            BuildCatItem(
              i: index,
              categoriesModel: CategoriesData.fromJson(
                  controller.categories[index]),
            ),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: controller.categories.length,
      ),
    );
  }
}




class BuildCatItem extends GetView<CategoryControllerImplement> {
  const BuildCatItem({Key? key, required this.categoriesModel, required this.i}) : super(key: key);
   final CategoriesData categoriesModel;
  final int? i;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              controller.goToItems(controller.categories, i!, categoriesModel.id.toString());
            },
            child: Row(
              children: [
                // Use a Flexible widget to allow the image to resize
                Flexible(
                  flex: 1,
                  child: CachedNetworkImage(
                    imageUrl:
                    ("${categoriesModel.image}"),
                    // fit: BoxFit.cover,
                    height: 130,

                  ),
                ),
                const SizedBox(width: 20.0),
                // Use an Expanded widget to allow the text to fill the remaining space
                Expanded(
                  flex: 3,
                  child: Responsive(
                    smallScreen: Text(
                      maxLines: 2,
                      "${categoriesModel.name}",
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: AppColor.black,
                      ),
                    ),
                    mediumScreen: Text(
                      maxLines: 2,
                      "${categoriesModel.name}",
                      style: const TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: AppColor.black,
                      ),
                    ),
                    largeScreen: Text(
                      maxLines: 2,
                      "${categoriesModel.name}",
                      style: const TextStyle(
                        fontSize: 100.0,
                        color: AppColor.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Use a Responsive widget to adjust the size of the arrow icon
                const Responsive(
                  smallScreen: Icon(Icons.arrow_forward_ios, size: 24.0),
                  mediumScreen: Icon(Icons.arrow_forward_ios, size: 40.0),
                  largeScreen: Icon(Icons.arrow_forward_ios, size: 100.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
