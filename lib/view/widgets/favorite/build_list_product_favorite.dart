import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/my_favorite_controller.dart';
import '../../../models/favoritge_model.dart';


import '../../../shared/styles/colors.dart';



class ListProductFavorite extends GetView<MyFavoriteController> {
  const ListProductFavorite({Key? key, required this.favoriteProduct}) : super(key: key);
 final FavoritesPorduct favoriteProduct;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;


    return InkWell(
      onTap: (){
        // controller.goToPageProductDetails(favoriteProduct);

      },
      child: SizedBox(
        height: 140,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0,),
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
                      imageUrl: ("${favoriteProduct.porduct!.image}"),
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    if(favoriteProduct.porduct!.discount !=null)
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
                          "${favoriteProduct.porduct!.name}",
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
                              "${favoriteProduct.porduct!.price}",
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: AppColor.defaultColor,
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),


                            if(favoriteProduct.porduct!.discount !=null)

                              Text(
                              "${favoriteProduct.porduct!.oldPrice}",
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const Spacer(),

                                GetBuilder<MyFavoriteController>(
                                  builder: (context) {
                                    return IconButton(
                                        onPressed: (){

                                          controller.removeFavorite(favoriteProduct.idFav.toString());


                                          // ignore: invalid_use_of_protected_member
                                        },
                                        icon: const Icon(
                                          Icons.delete_outline,
                                          color: AppColor.red,
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


















