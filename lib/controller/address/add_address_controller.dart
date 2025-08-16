import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/data/remote/address.dart';
import 'package:store_app_advanced/shared/constants/routes.dart';

import '../../data/helper/status_request.dart';
import '../../shared/function/handing_datacontroller.dart';
import '../../shared/services/services.dart';
import '../../shared/styles/colors.dart';
import '../../view/widgets/shared/toast_api.dart';

class AddAddressController extends GetxController{

  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  String? lat;
  String? long;

 late String token;

  GlobalKey<FormState> formState = GlobalKey<FormState>();


  // ignore: prefer_typing_uninitialized_variables
  // var address;



  TextEditingController? nameAddress;

  TextEditingController? city;

  TextEditingController? region;

  TextEditingController? details;




  AddressData addressData = AddressData(Get.find()) ;




  Future<void> initialData() async {
    token = myServices.sharedPreferences.getString("token") ?? "";

    nameAddress=TextEditingController();

    city=TextEditingController();

    region=TextEditingController();

    details=TextEditingController();

    lat=Get.arguments['lat'];

    long=Get.arguments['long'];


    print(lat);

    print(long);

    //
    // address = myServices.sharedPreferences.getInt("address");

  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }


  // ignore: non_constant_identifier_names
  AddAddress() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await addressData.addAddress(

        token: myServices.sharedPreferences.getString("token")!,
        name: nameAddress!.text,
        city: city!.text,
        region: region!.text,
        details: details!.text,
        latitude: lat!,
        longitude: long!,


        // phone: phone.text,
        // email: email.text,
        // password: password.text,
      );


      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        // Start backend
        if (response['status'] == true) {
          showToast(
              time: 5,
              msg: "Your address has been added successfully",
              backgroundColor: AppColor.defaultColor
          );
          // count=response["data"]["cart_items"];



          myServices.sharedPreferences.setString("nameAddress", response['data']['name']) ;

          myServices.sharedPreferences.setString("city", response['data']['city']);

          myServices.sharedPreferences.setString("region", response['data']['region']);

          myServices.sharedPreferences.setString("details", response['data']['details']);





          print(response);

          Get.offAllNamed(AppRoute.layout);





          // data.addAll(response['data']);
        } else {
          statusRequest = StatusRequest.failure;
        }
        // End
      }
      update();
    }


  }

}
