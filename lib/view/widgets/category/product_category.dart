import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/view/widgets/shared/handling_dataview.dart';

import '../../../controller/product_controller.dart';
import '../../../models/product_model.dart';
import '../product/list_product_item.dart';

class ProductCategoryScreen extends StatelessWidget {
  const ProductCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductControllerImplement());

    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: GetBuilder<ProductControllerImplement>(
            builder: (controller) {
              return
                ListView(
                  children: [
                    // customBar
                    //   (context: context,
                    //     hintText:"Find Product" ,
                    //     onChanged: (String value) {  },
                    //     onIconSearch: () {  },
                    //     // onIconFavorite: () {  }
                    // ),
                    const SizedBox(height: 15,),

                    const SizedBox(height: 20,),
                    HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget:
                      LayoutBuilder(
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
                            itemCount: controller.data.length, // Replace with the actual number of items
                            itemBuilder: (BuildContext context, int index) {
                              return  ListProductItem(
                                productsModel: Products.fromJson(controller.data[index],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                );

            }
        ),
      ),
    );
  }
}
