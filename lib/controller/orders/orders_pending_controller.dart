import 'package:get/get.dart';

import '../../data/helper/status_request.dart';
import '../../data/remote/order.dart';
import '../../models/orders_model.dart';
import '../../shared/function/handing_datacontroller.dart';
import '../../shared/services/services.dart';

class OrdersPendingController extends GetxController {



  MyServices myServices = Get.find();


  StatusRequest statusRequest = StatusRequest.none;

  OrderData orderData=OrderData(Get.find()) ;

  late String token;

  List<Order> data = [];

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order is being Prepared ";
    } else if (val == "2") {
      return "Ready To Picked up by Delivery man";
    }  else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }





  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await orderData.getOrdersPending(token:myServices.sharedPreferences.getString("token")! );

    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {

        List responsedata = response['data']['data'];

        data.addAll(responsedata.map((e) => Order.fromJson(e)));


      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshPage() {
    getOrders();
    // update();
  }




  removeOrder(  String orderId) async{


    //
    statusRequest = StatusRequest.loading;

    var response = await orderData.deleteOrder(
      token:  myServices.sharedPreferences.getString("token")!,
      id: orderId,
      // productId: id,
    );

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {


        print(response);
        // refreshPage();

      }else{
        statusRequest = StatusRequest.failure;

      }

      update();

      }

    update();

  }





  @override
  void onInit() {
    getOrders();

    token = myServices.sharedPreferences.getString("token") ?? "";
    super.onInit();
  }
}