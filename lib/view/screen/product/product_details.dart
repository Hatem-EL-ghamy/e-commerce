import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/view/widgets/shared/handling_dataview.dart';

import '../../../controller/product _details_controller.dart';
import '../../../shared/styles/colors.dart';
import '../../widgets/product_details/priceandcount.dart';
import '../../widgets/product_details/toppageproductdetails.dart';
import '../../widgets/shared/default_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImplement controller =
        Get.put(ProductDetailsControllerImplement());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product Details",
              style: TextStyle(color: AppColor.gray)),
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FloatingActionButton(
              heroTag: "arrow",
              elevation: 0,
              backgroundColor: AppColor.white,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: AppColor.gray,
              ),
            ),
          ),
          backgroundColor: AppColor.gray3,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, // Status bar
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          // height: 45,
          child: GetBuilder<ProductDetailsControllerImplement>(
              builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  defaultButton(
                    onPressed: () {
                     controller.addTOCart();
                      controller.cartController.addAndRemove(
                          controller.productModel.id.toString(),
                          controller.count.toString());
                    },
                    text: "Add To Cart",
                  ),


                ],
              ),
            );
          }),
          // child:
          //
          // MaterialButton(
          //
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(10)),
          //     color: AppColor.defaultColor,
          //     onPressed: () {},
          //     child: const Text(
          //       "Add To Cart",
          //       style: TextStyle(
          //         fontSize: 16,
          //           color: Colors.white, fontWeight: FontWeight.bold),
          //     )
          // )
        ),
        body: GetBuilder<ProductDetailsControllerImplement>(
            builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(children: [
              const TopProductPageDetails(),
              const SizedBox(
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${controller.productModel.name}",
                        style: const TextStyle(
                          color: AppColor.black,
                          fontSize: 20,
                        ),
                      ),

                      PriceAndCountItems(
                          onAdd: () {
                            controller.add();
                          },
                          onRemove: () {
                            controller.remove();


                          },
                          price: "${controller.productModel.price}",
                          count: controller.count.toString()),
                      const SizedBox(height: 20),
                      Text(
                        "${controller.productModel.description}",
                        style:
                            const TextStyle(color: AppColor.gray, fontSize: 16),
                      ),

                      // const SubitemsList()
                    ]),
              )
            ]),
          );
        }));
  }
}
