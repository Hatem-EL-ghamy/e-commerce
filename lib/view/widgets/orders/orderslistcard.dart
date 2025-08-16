import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/view/widgets/orders/rating_dialog.dart';

import '../../../controller/orders/orders_pending_controller.dart';
import '../../../models/orders_model.dart';
import '../../../shared/constants/routes.dart';
import '../../../shared/styles/colors.dart';

class CardOrdersList extends GetView<OrdersPendingController> {

  final Order listdata;
  const CardOrdersList({Key? key, required this.listdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    OrdersPendingController cartController= Get.put(OrdersPendingController());

    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order Number : #${listdata.id}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  // Text(listdata.ordersDatetime!)
                  Text(
                     (listdata.date.toString()),
                    style:  const TextStyle(
                        color: AppColor.defaultColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(),
              Text(
                  "Order Type : ${listdata.orderType}",style: const TextStyle(color: AppColor.gray1)),
              Text("Order Price : ${listdata.total} \$",style: const TextStyle(color: AppColor.gray1)),
              Text("Delivery Price : ${listdata.costDelivery} \$ ",style: const TextStyle(color: AppColor.gray1)),
              Text(
                  "Payment Method : ${listdata.paymentMethod} ",style: const TextStyle(color: AppColor.gray1)),
              Text(
                  "Order Status : ${listdata.status} ",style: const TextStyle(color: AppColor.gray1)),

              Text("Total Price : ${listdata.orderCost} EGP ",
                  style: const TextStyle(
                      color: AppColor.defaultColor,
                      fontWeight: FontWeight.bold)),
              // const Divider(),
              const SizedBox(height: 5,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  GetBuilder<OrdersPendingController>(
                    builder: (controller) {
                      return MaterialButton(
                        onPressed: () {
                        controller.removeOrder(listdata.id.toString());
                        },
                        color: AppColor.defaultColor,
                        textColor: AppColor.white,
                        child: const Text("Cancel"),
                      );
                    }
                  ),

                  const SizedBox(width: 10),

                  MaterialButton(
                    onPressed: () {
                      showDialogRating(context);
                    },
                    color: AppColor.defaultColor,
                    textColor: AppColor.white,
                    child: const Text("Rating"),
                  ),

                  // if (listdata.ordersStatus! == "0")
                  //   MaterialButton(
                  //   onPressed: () {
                  //     // controller.deleteOrder(listdata.ordersId!);
                  //   },
                  //   // color: AppColor.thirdColor,
                  //   // textColor: AppColor.secondColor,
                  //   child: const Text("Delete"),
                  // )
                ],
              ),
            ],
          )),
    );
  }
}