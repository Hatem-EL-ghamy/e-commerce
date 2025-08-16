import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/shared/styles/colors.dart';
import 'package:store_app_advanced/view/widgets/shared/handling_dataview.dart';

import '../../controller/cart_controller.dart';
import '../widgets/cart/custom_bottom_navgationbar_cart.dart';
import '../widgets/cart/product_cart.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    CartController cartController= Get.put(CartController());
    return
      GetBuilder<CartController>(
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(title: const Text("Cart",style: TextStyle(color: AppColor.gray,letterSpacing: 2,fontSize: 24),)),

            bottomNavigationBar: GetBuilder<CartController>(
              builder: (controller) {
                return
                     BottomNavgationBarCart(totalPrice: "${controller.total}",subtotal: "${controller.total}" ,);
              }
            ),

              body: HandlingDataView(
                statusRequest: controller.statusRequest,
                widget:
                 Column(
                  children: const [
                    // TopAppbarCart(title: "Cart",),
                    ProductCart(),

                  ],
                ),
              ));
        }
      );

  }
}
