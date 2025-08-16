
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/details_controller.dart';
import '../../../shared/styles/colors.dart';
import '../../widgets/shared/handling_dataview.dart';

class OrdersRating extends StatelessWidget {
  const OrdersRating({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Details'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<OrdersDetailsController>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Table(
                            children: [
                              TableRow(children: [
                                Text("Item",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.defaultColor,
                                        fontWeight: FontWeight.bold)),
                                Text("QTY",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.defaultColor,
                                        fontWeight: FontWeight.bold)),
                                Text("Price",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.defaultColor,
                                        fontWeight: FontWeight.bold)),
                              ]),
                              // TableRow(children: [
                              //   Text("Macbook m1", textAlign: TextAlign.center),
                              //   Text("2", textAlign: TextAlign.center),
                              //   Text("1200", textAlign: TextAlign.center),
                              // ]),
                              // ...List.generate(
                              //     controller.data.length,
                              //         (index) => TableRow(children: [
                              //       Text("${controller.data[index].itemsName}",
                              //           textAlign: TextAlign.center),
                              //       Text("${controller.data[index].countitems}", textAlign: TextAlign.center),
                              //       Text("${controller.data[index].itemsprice}",
                              //           textAlign: TextAlign.center),
                              //     ]))
                            ],
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child:   Text("Total Price : ${controller.ordersModel.orderCost}\$",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: AppColor.defaultColor,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),

                  if (controller.ordersModel.orderType == "Delivery")

                    Card(
                    child:    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...List.generate(
                          controller.dataAddress.length,
                              (index) => ListTile(
                                title:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Shipping Address",
                                      style: TextStyle(
                                          color: AppColor.defaultColor,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18),
                                    ),
                                     Text(
                                      "${controller.dataAddress[index].city}",
                                      style: const TextStyle(
                                          color: AppColor.gray,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                                subtitle: Text("${controller.dataAddress[index].region} ${controller.dataAddress[index].details}",),
                              )
                        )
                      ],
                    ),
                  ),

                ])))),
      ),
    );
  }
}