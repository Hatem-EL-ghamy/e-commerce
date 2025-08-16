
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/shared/constants/routes.dart';

import '../../data/helper/status_request.dart';
import '../../data/remote/address.dart';
import '../../shared/function/handing_datacontroller.dart';
import '../../shared/services/services.dart';
import '../../shared/styles/colors.dart';
import '../../view/widgets/shared/toast_api.dart';

class UpdateAddressController extends GetxController{

  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  String? lat;
  String? long;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  AddressData addressData = AddressData(Get.find()) ;


  // ignore: prefer_typing_uninitialized_variables
  // var address;


  String? nameAddress;

  String? city;

  String? region;

  String? details;

  late String token;


var  nameController=TextEditingController();

  var  cityController=TextEditingController();

  var  regionController=TextEditingController();

  var  detailsController=TextEditingController();



  Future<void> initialData() async {

    // token = myServices.sharedPreferences.getString("token") ?? "";

    nameAddress = myServices.sharedPreferences.getString("nameAddress");

    city = myServices.sharedPreferences.getString("city");
    region = myServices.sharedPreferences.getString("region");

    details = myServices.sharedPreferences.getString("details");


    lat=Get.arguments['lat'];

    long=Get.arguments['long'];


    print(lat);

    print(long);


    //
    // address = myServices.sharedPreferences.getInt("address");

  }


  updateAddress() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await addressData.updateAddress(
        token: myServices.sharedPreferences.getString("token")!,
        name: nameController.text,
        city: cityController.text,
        details: detailsController.text,
        region: regionController.text,
        latitude: lat!,
        longitude: long!,


      );

      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == true) {

          showToast(
              msg: "Your address has been updated successfully",
              backgroundColor:AppColor.defaultColor
          );

          Get.offAllNamed(AppRoute.layout);

        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
    update();
  }

  @override
  void onInit() {




    // nameController.text =myServices.sharedPreferences.getString("nameAddress")!  ;
    // cityController.text = myServices.sharedPreferences.getString("city")!;
    // detailsController.text = myServices.sharedPreferences.getString("details")! ;
    // regionController.text = myServices.sharedPreferences.getString("region")! ;
    //

    initialData();
    super.onInit();
  }




}
