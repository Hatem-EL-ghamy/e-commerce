import 'dart:async';
import 'package:get/get.dart';
import 'package:store_app_advanced/data/remote/address.dart';

import '../../data/helper/status_request.dart';
import '../../models/view_address_model.dart';
import '../../shared/function/handing_datacontroller.dart';
import '../../shared/services/services.dart';
import '../../shared/styles/colors.dart';
import '../../view/widgets/shared/toast_api.dart';
import '../home_controller.dart';

class ViewAddressController extends GetxController{

  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();



  late String token;


  List<Address> data=[];


  // ignore: prefer_typing_uninitialized_variables
  // var address;


  AddressData addressData = AddressData(Get.find()) ;

  HomeControllerImplement homeController= Get.put(HomeControllerImplement());



  Future<void> initialData() async {


    token = myServices.sharedPreferences.getString("token") ?? "";

    //
    // address = myServices.sharedPreferences.getInt("address");

  }

  @override
  void onInit() {
    initialData();
    GetAddress();
    super.onInit();
  }


  // ignore: non_constant_identifier_names
  GetAddress() async {
       data.clear();

      statusRequest = StatusRequest.loading;

      var response = await addressData.getAddress(

        token: myServices.sharedPreferences.getString("token")!,

      );

      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        // Start backend
        if (response['status'] == true) {


          List responsedata = response['data']['address'];


          data.addAll(responsedata.map((e) => Address.fromJson(e)));


          print(response);




          // data.addAll(response['data']);
        } else {
          statusRequest = StatusRequest.failure;
        }
        // End
      }
      update();

  }



  // ignore: non_constant_identifier_names
  DeleteAddress() async {
    // data.clear();

    var response = await addressData.deleteAddress(

      token: myServices.sharedPreferences.getString("token")!,

    );

    print("=============================== Controller $response ");
    statusRequest = handlingData(response);

      // Start backend


    showToast(
      time: 5,
      msg: "Your address has been deleted",
      backgroundColor:AppColor.gray,
    );



    homeController.refreshPage();


    GetAddress();


        // data.addAll(response['data']);
    update();

  }




  refreshPage() {
    GetAddress();
    update();
  }


}
