import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/shared/styles/colors.dart';

import '../../../controller/favorite_controller.dart';
import '../../../controller/home_controller.dart';
import '../../../models/product_model.dart';


class ListsProductItem extends GetView<HomeControllerImplement> {
  const ListsProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavoriteController controllerFav= Get.put(FavoriteController());

    return  LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        const crossAxisCount = 2;
        final childAspectRatio =
            constraints.maxWidth / (crossAxisCount * 300);
        return GridView.builder(
          shrinkWrap: true,
          // padding: const EdgeInsets.all(10),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: controller.products.length, // Replace with the actual number of items
          itemBuilder: (BuildContext context, int index) {
            controllerFav.isFavorite[controller.products[index]['id']]=controller.products[index]["in_favorites"];

            return  ProductItem(
                productsModel: Products.fromJson(controller.products[index]),
            );
          },
        );
      },
    );
  }
}





class ProductItem extends GetView<HomeControllerImplement>{
  const ProductItem( {Key? key, required this.productsModel,}) : super(key: key);
  final Products productsModel;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(productsModel);
      },
      child: Card(
        elevation: 5,
        color: AppColor.gray3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            color: AppColor.gray1,
            width: 1.25,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.02,
            vertical: screenSize.height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    CachedNetworkImage(

                       imageUrl: ("${productsModel.image}"),
                      width: double.infinity,
                      height: 130,

                    ),
                    if(productsModel.discount !=null)
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.01),
                      color: Colors.red,
                      child: const Text(
                        "DISCOUNT",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${productsModel.name}",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.black,
                  height: 1.3,
                  fontSize: screenSize.width * 0.044,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                // mainAxisSize:MainAxisSize.min,
                textBaseline:TextBaseline.alphabetic ,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${productsModel.price} EGP",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: screenSize.width * 0.038,
                        ),
                      ),
                      if(productsModel.discount !=null)
                      Text(
                        "${productsModel.oldPrice}",
                        style: TextStyle(
                          fontSize: screenSize.width * 0.035,
                          decoration: TextDecoration.lineThrough,
                          height: 1.1
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),
                  GetBuilder<FavoriteController>(
                    builder: (controller) {
                      return IconButton(

                        padding: EdgeInsets.zero,
                        onPressed: () {
                          if(controller.isFavorite[productsModel.id]==true){
                            controller.setFavorite(productsModel.id, false);
                            controller.removeFavorite(productsModel.id.toString());
                          }
                          else{
                            controller.setFavorite(productsModel.id, true);
                            controller.addFavorite(productsModel.id.toString());

                          }
                        },
                        icon: controller.isFavorite[productsModel.id]==true?CircleAvatar(
                          radius: screenSize.width * 0.035,
                          backgroundColor: AppColor.defaultColor,
                          child: Icon(
                            Icons.favorite_border,
                            size: screenSize.width * 0.045,
                            color: Colors.white,
                          ),
                        ):CircleAvatar(
                          radius: screenSize.width * 0.035,
                          backgroundColor: AppColor.gray,
                          child: Icon(
                            Icons.favorite_border,
                            size: screenSize.width *  0.045,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}