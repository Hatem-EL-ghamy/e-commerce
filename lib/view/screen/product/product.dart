import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/view/widgets/shared/handling_dataview.dart';
import '../../../controller/favorite_controller.dart';
import '../../../controller/product_controller.dart';
import '../../../models/product_model.dart';
import '../../widgets/product/list_category_item.dart';
import '../../widgets/product/list_product_item.dart';
import '../../widgets/shared/custom _bar.dart';
import '../home.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductControllerImplement());
    FavoriteController controllerFav= Get.put(FavoriteController());
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: GetBuilder<ProductControllerImplement>(
          builder: (controller) {
            return
               ListView(
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
                  const SizedBox(height: 15,),

                  const ListCategoryItems(),
                  const SizedBox(height: 20,),

              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget:
                !controller.isSearch? LayoutBuilder(
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
                        controllerFav.isFavorite[controller.data[index]['id']]=controller.data[index]["in_favorites"];

                        return  ListProductItem(
                          productsModel: Products.fromJson(controller.data[index],
                          ),
                        );
                      },
                    );
                  },
                ):Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ListsSearchProduct(searchModel: controller.Listdata,),
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
