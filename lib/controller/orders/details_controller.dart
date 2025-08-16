import 'dart:async';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/helper/status_request.dart';
import '../../data/remote/address.dart';
import '../../data/remote/order.dart';
import '../../models/orders_model.dart';
import '../../models/view_address_model.dart';
import '../../shared/function/handing_datacontroller.dart';
import '../../shared/services/services.dart';

class OrdersDetailsController extends GetxController {


  OrderData orderData=OrderData(Get.find()) ;
  MyServices myServices = Get.find();

  AddressData addressData = AddressData(Get.find()) ;
  List<Address> dataAddress=[];

  // List<CartItems> data = [];



  // late Address dataAddress;

   StatusRequest statusRequest=StatusRequest.none;


  late Order ordersModel;

  // Completer<GoogleMapController>? completercontroller;

  // List<Marker> markers = [];
  //
  // double? lat;
  // double? long;
  //
  // CameraPosition? cameraPosition;

  // intialData() {
  //
  //   // if (ordersModel.orderType == "0") {
  //   //   cameraPosition = CameraPosition(
  //   //     target: LatLng(double.parse(ordersModel.addressLat!),
  //   //         double.parse(ordersModel.addressLong!)),
  //   //     zoom: 12.4746,
  //   //   );
  //   //   markers.add(Marker(
  //   //       markerId: MarkerId("1"),
  //   //       position: LatLng(double.parse(ordersModel.addressLat!),
  //   //           double.parse(ordersModel.addressLong!))));
  //   // }
  // }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersModel'];
    getShippingAddress();
    // getData();
    super.onInit();
  }


  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await orderData.getOrdersDetails(
        token: myServices.sharedPreferences.getString("token")!,
        id: ordersModel.id!.toString(),
    );

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == true){
        List listdata = response['data'];
        // data.addAll(listdata.map((e) => CartItems.fromJson(e)));


      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }



  getShippingAddress() async {

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


        dataAddress.addAll(responsedata.map((e) => Address.fromJson(e)));


        print(response);




        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }



}