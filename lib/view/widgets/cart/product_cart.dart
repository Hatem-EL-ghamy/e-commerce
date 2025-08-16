import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/cart_controller.dart';
import '../../../models/cart_model.dart';
import '../../../shared/styles/colors.dart';

class ProductCart extends GetView<CartController> {
  const ProductCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ListProductCart(

              cartProduct: controller.dataCart[index],

            );
          },
          itemCount: controller.dataCart.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 5,
            );
          },
        ),
      ),
    );
  }
}


class ListProductCart extends GetView<CartController> {
  const ListProductCart( {Key? key, required this.cartProduct})
      : super(key: key);

  final CartItems cartProduct;


  @override
  Widget build(BuildContext context) {

    return GetBuilder<CartController>(

    builder: (controller) {
        return InkWell(
          onTap: (){

          },
          child: SizedBox(
            height: 150,
            child: Card(
              color: Colors.white,
              elevation: 5,
              child: Row(
                children: [
                  Container(
                    height: 150,
                    color: AppColor.gray3,
                    width: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CachedNetworkImage(
                        imageUrl: ("${cartProduct.product!.image}"),
                        // height: double.infinity,
                        // width: double.infinity,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${cartProduct.product!.name}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 18, color: AppColor.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),

                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${cartProduct.product!.price} EGP",
                                  style: const TextStyle(
                                    color: AppColor.defaultColor,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 140,
                                  height: 40,
                                  color: Colors.grey.shade200,
                                  child:Center(
                                    child: RichText(
                                      text: TextSpan(
                                          text: 'quantity: ',
                                          style: const TextStyle(color: AppColor.defaultColor, fontSize: 18),
                                          children: <TextSpan>[
                                            TextSpan(text: '${cartProduct.quantity}',
                                                style: const TextStyle(color: AppColor.black, fontSize: 16,fontWeight: FontWeight.w900)
                                            )
                                          ]
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                            const Spacer(),

                               SizedBox(
                                width: 60,
                                height: 60,
                                child: GetBuilder<CartController>(
                                  builder: (controller) {
                                    return IconButton(
                                      onPressed: () {
                                        controller.removeCart(cartProduct.id.toString());
                                        controller.refreshPage();
                                      },
                                      icon: const Icon(
                                        Icons.delete_outline,
                                        color: AppColor.red,
                                      ),
                                      iconSize: 30,
                                      padding: EdgeInsets.zero,
                                    );
                                  }
                                ),
                              ),

                          ],
                        ),


                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}


