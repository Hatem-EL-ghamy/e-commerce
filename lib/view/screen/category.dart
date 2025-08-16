import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/view/widgets/shared/handling_dataview.dart';

import '../../controller/category_controller.dart';

import '../widgets/category/build_category_Item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.put(CategoryControllerImplement());

    return GetBuilder<CategoryControllerImplement>(

        builder: (controller) {


        return RefreshIndicator(
          onRefresh: () async{
            await controller.refreshPage();

            return Future.delayed(const Duration(seconds: 1)); // Delay the completion of the refresh to show the indicator

          },
          child: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget:
             Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(16.0),

                  // child: customBar
                  //   (context: context,
                  //   hintText:"Find Category" ,
                  //   onChanged: (String value) {
                  //     // controller.onSearchProduct();
                  //     controller.checkSearch(value);
                  //   },
                  //   onIconSearch: () {
                  //     controller.onSearchProduct();
                  //   },
                  //
                  //
                  //   myController:controller.search!,
                  //   onTap: () {
                  //     // controller.onSearchProduct();
                  //
                  //   }, onSubmitted: (String value) {
                  //
                  //
                  //     controller.onSearchProduct();
                  //
                  //     controller.checkSearch(value);
                  //
                  //   },
                  //   // onIconFavorite: () {
                  //   //
                  //   //
                  //   // }
                  // ),


                ),

                ListCategoryItem()

              ],
            ),
          ),
        );
      }
    );
  }
}







