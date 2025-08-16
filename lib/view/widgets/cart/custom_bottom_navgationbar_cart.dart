
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller.dart';
import '../../../shared/styles/colors.dart';
import '../shared/default_button.dart';

class BottomNavgationBarCart extends GetView<CartController> {

  final String totalPrice ;
  final String subtotal ;


  const BottomNavgationBarCart( {Key? key,  required this.totalPrice,required this.subtotal,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [


        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),//<-- SEE HERE
            side: const BorderSide(
              color: AppColor.defaultColor,

            ),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          // elevation: 10,
          child: Column(
            children: [


              const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text("Subtotal",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColor.gray1))),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text("$subtotal \$",
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColor.gray1)))
                  ],
                ),
              ),

               Divider(color: AppColor.gray2,height: 10,indent: 10,endIndent: 10,thickness: 2),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text("Total Price",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColor.defaultColor))),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text("$totalPrice \$",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColor.defaultColor)))
                  ],
                ),
              ),
              const SizedBox(height: 5,),
            ],
          ),
        ),

    
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(right: 20,left: 20,bottom: 10),
          child: defaultButton(
            onPressed: (){
              controller.goToPageCheckout();
            },
            text: "Buy Now",
          ),
        ),
      ],
    );
  }
}