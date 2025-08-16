import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/product_controller.dart';
import '../../../models/home_model.dart';
import '../../../shared/styles/colors.dart';

class ListCategoryItems extends GetView<ProductControllerImplement> {
  const ListCategoryItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 20,
      child: GetBuilder<ProductControllerImplement>(
        builder: (controller) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CategoryItem(
              i: index,
              categoriesModel: Categories.fromJson(controller.categories[index]),
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: controller.categories.length,
          );
        }
      ),
    );
  }
}

class CategoryItem extends GetView<ProductControllerImplement> {
  const CategoryItem( {
    Key? key,
    required this.categoriesModel,
    required this.i,
  }) : super(key: key);

  final Categories categoriesModel;
  final int? i;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(i! , categoriesModel.id.toString());
      },
      child: GetBuilder<ProductControllerImplement>(
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: controller.selectedCat == i
                ? const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 3,
                  color: AppColor.defaultColor,
                ),
              ),
            )
                : null,
            child: Text(
              "${categoriesModel.name}",
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColor.gray,
                // fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.048,
              ),
            ),
          );
        },
      ),
    );
  }
}