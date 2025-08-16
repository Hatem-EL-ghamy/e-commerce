import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/shared/constants/routes.dart';
import 'package:store_app_advanced/shared/styles/colors.dart';

import '../../../controller/address/view_address_controller.dart';
import '../../../controller/home_controller.dart';
import '../../../models/view_address_model.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ViewAddressController controller= Get.put(ViewAddressController());

    HomeControllerImplement homeController= Get.put(HomeControllerImplement());


    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Address",
        style: TextStyle(color: AppColor.gray, fontSize: 24),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          homeController.refreshPage();
          Get.toNamed(AppRoute.map);
        },
        child: const Icon(Icons.location_on_outlined),
      ),

      body: GetBuilder<ViewAddressController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
                itemBuilder: (context, index) => CartAddress(addressModel: controller.data[index],),
              itemCount: controller.data.length,

            ),
          );
        }
      ),
    );
  }
}


class CartAddress extends StatelessWidget {
  const CartAddress({Key? key, required this.addressModel}) : super(key: key);

  final Address  addressModel;

  @override
  Widget build(BuildContext context) {


    return  Card(
      elevation: 10,

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(

          contentPadding: EdgeInsets.zero,

          title:  Text("${addressModel.city}",),

          subtitle:Text("${addressModel.region} ${addressModel.details}",),

          trailing: GetBuilder<ViewAddressController>(
            builder: (controller) {
              return IconButton(
                padding: EdgeInsets.zero,
                onPressed: (){

                  controller.DeleteAddress();

                },

                icon: const Icon(Icons.delete_outline,color: AppColor.red,size: 30),
              );
            }
          ),





          // Row(
          //   children: [
          //     const Text("City: ",style: TextStyle(color: AppColor.defaultColor)),
          //     Text("${addressModel.city}",style: const TextStyle(color: AppColor.black)),
          //   ],
          // ),
          //
          // Row(
          //   children: [
          //     const Text("Street: ",style: TextStyle(color: AppColor.defaultColor)),
          //     Text("${addressModel.region}",style: const TextStyle(color: AppColor.black)),
          //   ],
          // ),



        ),
      ),

    );
  }
}
