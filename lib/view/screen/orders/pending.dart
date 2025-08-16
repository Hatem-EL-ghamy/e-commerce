import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/orders_pending_controller.dart';
import '../../widgets/orders/orderslistcard.dart';
import '../../widgets/shared/handling_dataview.dart';

class OrderPending extends StatelessWidget {
  const OrderPending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());

    return Scaffold(

      appBar: AppBar(title: const Text("Orders")),

        body: Container(
          padding:const  EdgeInsets.all(10),
          child: GetBuilder<OrdersPendingController>(
              builder: ((controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemCount: controller.data.length,
                itemBuilder: ((context, index) =>
                    CardOrdersList(listdata: controller.data[index])),
              )))),
        ),


    );
  }
}
