import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/shared/styles/colors.dart';
import '../../../controller/admin/categories/view_categories_controller.dart';
import '../../../models/categories_model.dart';

class ListCategory extends GetView<CategoriesController> {
  const ListCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: ListView.builder(

        physics: const BouncingScrollPhysics(),

        itemBuilder: (context, index) =>
            BuildCategoryItem(
                index: index,

              categoriesModel:controller.data[index]),


        // separatorBuilder: (context, index) => myDivider(),
        itemCount: controller.data.length,
      ),
    );
  }
}



class BuildCategoryItem extends GetView<CategoriesController> {
  const BuildCategoryItem( {Key? key, required this.categoriesModel,required this.index,}) : super(key: key);
  final CategoriesData categoriesModel;

  final int index;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return   Padding(
      padding:  EdgeInsets.symmetric(horizontal:screenWidth/35 ),
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            // Use a Flexible widget to allow the image to resize
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(4),

                child: CachedNetworkImage(
                  imageUrl:
                  ("${categoriesModel.image}"),
                  height: screenHeight/8,

                  // fit: BoxFit.cover,
                ),
              ),
            ),
            // const SizedBox(width: 20.0),
            // Use an Expanded widget to allow the text to fill the remaining space
            Expanded(
              flex: 3,
              child: ListTile(
                trailing:
                    Row(
                mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: (){
                          Get.defaultDialog(title: 'warning',onCancel:(){},
                              confirmTextColor: AppColor.white,
                              onConfirm: ()

                          {


                            controller.removeCategory(categoriesModel.id.toString());
                            Get.back();
                          }

                          );


                        },icon: const Icon(Icons.delete)),

                        IconButton(onPressed: (){

                            controller.goToPageUpdate(controller.data[index]);
                            // Get.back();

                        },icon: const Icon(Icons.edit)),
                      ],
                    ),

                contentPadding: EdgeInsets.zero,
                title: Text( "${categoriesModel.name}",style: const TextStyle(fontWeight: FontWeight.w900)),
                // subtitle:Text( "${categoriesModel.}",) ,
              ),

              // child: Responsive(
              //   smallScreen: Text(
              //     maxLines: 2,
              //     "${categoriesModel.name}",
              //     style: const TextStyle(
              //       fontSize: 20.0,
              //       fontWeight: FontWeight.bold,
              //       color: AppColor.black,
              //     ),
              //   ),
              //   mediumScreen: Text(
              //     maxLines: 2,
              //     "${categoriesModel.name}",
              //     style: const TextStyle(
              //       fontSize: 40.0,
              //       fontWeight: FontWeight.bold,
              //       color: AppColor.black,
              //     ),
              //   ),
              //   largeScreen: Text(
              //     maxLines: 2,
              //     "${categoriesModel.name}",
              //     style: const TextStyle(
              //       fontSize: 100.0,
              //       color: AppColor.black,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
            ),
            // Use a Responsive widget to adjust the size of the arrow icon
          ],
        ),
      ),
    );
  }
}
