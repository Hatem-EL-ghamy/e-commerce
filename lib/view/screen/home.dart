import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/view/widgets/shared/handling_dataview.dart';

import '../../controller/favorite_controller.dart';
import '../../controller/home_controller.dart';
import '../../models/product_model.dart';
import '../../shared/styles/colors.dart';
import '../widgets/home/banner.dart';
import '../widgets/home/category_home.dart';
import '../widgets/home/prodect_home.dart';
import '../widgets/shared/custom _bar.dart';
import '../widgets/home/title_home.dart';
import '../widgets/shared/my_divider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Get.put(HomeControllerImplement());

    return
       GetBuilder<HomeControllerImplement>(
        builder: (controller) {
          return RefreshIndicator(
            onRefresh: () async{
              await controller.refreshPage();

              return Future.delayed(const Duration(seconds: 1)); // Delay the completion of the refresh to show the indicator

            },
            child: HandlingDataView(
              statusRequest: controller.statusRequest,
              widget:
               SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      customBar
                        (context: context,
                          hintText:"Find Product" ,
                          onChanged: (String value) {
                          // controller.onSearchProduct();
                          controller.checkSearch(value);
                          },
                          onIconSearch: () {
                          controller.onSearchProduct();
                          },


                        myController:controller.search!,
                        onTap: () {
                          // controller.onSearchProduct();

                        }, onSubmitted: (String value) {


                          controller.onSearchProduct();

                          controller.checkSearch(value);

                        },
                          // onIconFavorite: () {
                          //
                          //
                          // }
                    ),

                    !controller.isSearch? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bannerCard(),
                          titleHome("Category", context),
                          const CategoryItem(),

                          titleHome("Products", context),
                          const ListsProductItem(),

                        ],

                      ): Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ListsSearchProduct(searchModel: controller.Listdata,),
                      ),


                    ],
                  ),
                ),
              ),
            ),
          );
        }
      );

  }
}






class ListsSearchProduct extends GetView<HomeControllerImplement> {
  const ListsSearchProduct({Key? key, required this.searchModel, }) : super(key: key);

  final List<Products> searchModel;

  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;

    return ListView.separated(
          shrinkWrap: true,
          // padding: const EdgeInsets.all(10),
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: searchModel.length, // Replace with the actual number of items
          itemBuilder: (BuildContext context, int index) {

            return   InkWell(
              onTap: (){

                controller.goToPageProductDetails(searchModel[index]);

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
                              imageUrl: ("${searchModel[index].image}"),
                              height: double.infinity,
                              width: double.infinity,
                            ),
                            if(searchModel[index].discount !=null)
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
                                  "${searchModel[index].name}",
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
                                      "${searchModel[index].price}",
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        color: AppColor.defaultColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),


                                    if(searchModel[index].discount !=null)

                                      Text(
                                        "${searchModel[index].oldPrice}",
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
                                              if(controller.isFavorite[searchModel[index].id]==true){
                                                controller.setFavorite(searchModel[index].id, false);

                                                controller.removeFavorite(searchModel[index].id.toString());
                                              }
                                              else{

                                                controller.setFavorite(searchModel[index].id, true);
                                                controller.addFavorite(searchModel[index].id.toString());

                                              }
                                            },
                                            icon:controller.isFavorite[searchModel[index].id]==true? CircleAvatar(
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
                                                size: screenSize.width * 0.045,
                                                color: Colors.white,
                                              ),
                                            ),
                                          );
                                        }
                                    ),

                                    // GetBuilder<MyFavoriteController>(
                                    //     builder: (context) {
                                    //       return IconButton(
                                    //         onPressed: (){
                                    //           controller.removeFavorite(favoriteProduct.id_fav!.toString());
                                    //         },
                                    //         icon: const Icon(
                                    //           Icons.delete_outline,
                                    //           color: AppColor.red,
                                    //         ),
                                    //       );
                                    //     }
                                    // ),

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
          },
        );

  }
}

