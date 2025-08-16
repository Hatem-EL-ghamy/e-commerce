import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/view/widgets/shared/handling_dataview.dart';

import '../../../controller/address/add_address_controller.dart';
import '../../../controller/home_controller.dart';
import '../../../shared/styles/colors.dart';
import '../../widgets/shared/default_button.dart';
import '../../widgets/shared/default_form_field.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AddAddressController controllerPage=Get.put(AddAddressController());

    HomeControllerImplement homeController= Get.put(HomeControllerImplement());

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Add Details Address",
            style: TextStyle(color: AppColor.gray, fontSize: 20),
          )),

      body: GetBuilder<AddAddressController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget:
             Form(
               key: controller.formState,
               child: Container(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [

                    const SizedBox(height: 30,),
                    defaultFormField(
                      controller: controller.nameAddress,
                      label: "Name",
                      prefix: Icons.person_outline,
                      type: TextInputType.name,
                      validate: (value) {
                        if(value!.isEmpty)
                        {
                          return "The Name field is required";
                        }
                        return null;
                      },
                      hint: 'Enter Name',
                    ),

                    const SizedBox(height: 30,),
                    defaultFormField(
                      controller: controller.city,
                      label: "City",
                      prefix: Icons.location_city,
                      type: TextInputType.streetAddress,
                      validate: (value) {
                        if(value!.isEmpty)
                          {
                            return "The City field is required";
                          }
                        return null;
                      },
                      hint: 'Enter City',
                    ),
                    const SizedBox(height: 30,),
                    defaultFormField(
                      controller: controller.region,
                      label: "Street",
                      prefix: Icons.streetview,
                      type: TextInputType.streetAddress,
                      validate: (value) {
                        if(value!.isEmpty)
                        {
                          return "The Street field is required";
                        }
                        return null;
                      },
                      hint: 'Enter Street',
                    ),

                    const SizedBox(height: 30,),
                    defaultFormField(
                      controller: controller.details,
                      label: "Details",
                      prefix: Icons.details,
                      type: TextInputType.text,
                      validate: (value) {
                        if(value!.isEmpty)
                        {
                          return "The Details field is required";
                        }
                        return null;
                      },
                      hint: 'Enter Details',
                    ),

                    const SizedBox(height: 50),

                    defaultButton(
                      text: "Add",

                      onPressed: () {

                        controller.AddAddress();

                        homeController.refreshPage();


                      },
                    ),


                  ],
                ),
            ),
             ),
          );
        }
      ),

    );
  }
}


// AIzaSyBjUkDs59q6R2-3Q3cLqt_sYHsZ6OMsX7U
