import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/shared/styles/colors.dart';

import '../../../controller/favorite_controller.dart';
import '../../../controller/home_controller.dart';
import '../../../models/search_product.dart';
import '../../../shared/constants/routes.dart';
import '../shared/my_divider.dart';


class ListsSearchProduct extends GetView<HomeControllerImplement> {
  const ListsSearchProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavoriteController controllerFav= Get.put(FavoriteController());

        return ListView.separated(
          shrinkWrap: true,
          // padding: const EdgeInsets.all(10),
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: controller.products.length, // Replace with the actual number of items
          itemBuilder: (BuildContext context, int index) {
            // controllerFav.isFavorite[controller.products[index]['id']]=controller.products[index]["in_favorites"];

            return  SearchItem(
              searchModel: Search.fromJson(controller.products[index]),
            );
          },
        );

  }
}





class SearchItem extends GetView<HomeControllerImplement>{
  const SearchItem( {Key? key, required this.searchModel,}) : super(key: key);
  final Search searchModel;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return InkWell(
      onTap: (){
        Get.toNamed(AppRoute.productDetails);
      },
      child: SizedBox(
        height: 140,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    CachedNetworkImage(
                      imageUrl: ("${searchModel.image}"),
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    if(searchModel.discount !=null)
                      Container(
                        color: Colors.red,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                          vertical: 2.0,
                        ),
                        child: const Text(
                          'DISCOUNT',
                          style: TextStyle(
                            fontSize: 8.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(

                        child: Text(
                          "${searchModel.name}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16.0,
                            height: 1.3,
                          ),
                        ),
                      ),

                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${searchModel.price}",
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: AppColor.defaultColor,
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),


                            if(searchModel.discount !=null)

                              Text(
                                "${searchModel.oldPrice}",
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            const Spacer(),


                            GetBuilder<FavoriteController>(
                                builder: (controller) {
                                  return IconButton(

                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      if(controller.isFavorite[searchModel.id]==true){
                                        controller.setFavorite(searchModel.id, false);
                                        controller.removeFavorite(searchModel.id.toString());
                                      }
                                      else{
                                        controller.setFavorite(searchModel.id, true);
                                        controller.addFavorite(searchModel.id.toString());

                                      }
                                    },
                                    icon: controller.isFavorite[searchModel.id]==true?CircleAvatar(
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}