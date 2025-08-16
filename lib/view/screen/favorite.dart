import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/shared/styles/colors.dart';
import 'package:store_app_advanced/view/widgets/shared/handling_dataview.dart';

import '../../controller/home_controller.dart';
import '../../controller/my_favorite_controller.dart';
import '../widgets/favorite/build_list_product_favorite.dart';

import '../widgets/shared/my_divider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());

    HomeControllerImplement cartController= Get.put(HomeControllerImplement());


    return WillPopScope(
      onWillPop: () async {

        Get.back(
          result: cartController.refreshPage(),
        );
        return true;
      },
      child: Scaffold(

        appBar: AppBar(
          // toolbarHeight: 0,
          title: const Text("my favourite",style: TextStyle(color: AppColor.gray,fontSize: 24)),

          leading: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: IconButton(icon:const Icon(Icons.arrow_back_ios,color: AppColor.gray),onPressed: (){

              Get.back(
                result: cartController.refreshPage(),
              );

            }),
          ),
        ),
        body: GetBuilder<MyFavoriteController>(
          builder: (controller) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
               //
               // Container(
               //   child: Row(
               //     children: [
               //
               //     ],
               //   ),
               // ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ListProductFavorite(
                        favoriteProduct: controller.data[index],
                      ),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: controller.data.length,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
