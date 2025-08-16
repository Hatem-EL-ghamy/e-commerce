import 'package:get/get.dart';

import '../../data/helper/status_request.dart';
import '../../data/remote/address.dart';
import '../../data/remote/cart.dart';
import '../../data/remote/order.dart';
import '../../models/view_address_model.dart';
import '../../shared/constants/routes.dart';
import '../../shared/function/handing_datacontroller.dart';
import '../../shared/services/services.dart';
import '../cart_controller.dart';

class CheckoutController extends GetxController {


  // AddressData addressData = Get.put(AddressData(Get.find()));

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;


  CartController cartController= Get.put(CartController());


  String? paymentMethod;

  String? deliveryType;
  String? addressid;


  late String total;

  late String token;

  AddressData addressData = AddressData(Get.find()) ;




  OrderData orderData=OrderData(Get.find()) ;


  CartData cartData=CartData(Get.find());


  List<Address> data=[];

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
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


        data.addAll(responsedata.map((e) => Address.fromJson(e)));

        addressid=data[0].id.toString();


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
  CheckoutOrder() async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "Please select a payment method");
    }
    if (deliveryType == null) {
      return Get.snackbar("Error", "Please select a order Type");
    }

    if (addressid == null) {
      return Get.snackbar("Error", "Please select a address");
    }


    statusRequest = StatusRequest.loading;

    var response = await orderData.addOrder(

      token: myServices.sharedPreferences.getString("token")!,
      address_id:addressid.toString() ,
      order_type:deliveryType.toString() ,
      cost_delivery:"10" ,
      payment_method:paymentMethod.toString() ,
      total:total ,

    );

    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == true) {

        print("success");

        cartController.removeAllCart();

        Get.offAllNamed(AppRoute.layout);

        Get.snackbar("success", " The order has been successfully requested");




        print(response);

        // removeAllCart();



        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.none;

        Get.snackbar("Error", "please try again");
      }


      // End
    }
    update();

  }



  Future<void> initialData() async {


    token = myServices.sharedPreferences.getString("token") ?? "";

    //
    // address = myServices.sharedPreferences.getInt("address");

  }


  @override
  void onInit() {
    initialData();
    total=Get.arguments['total'];
    getShippingAddress();
    super.onInit();
  }
}