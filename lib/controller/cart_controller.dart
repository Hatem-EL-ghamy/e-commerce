import 'package:get/get.dart';

import '../data/helper/status_request.dart';
import '../data/remote/cart.dart';
import '../models/cart_model.dart';
import '../shared/constants/routes.dart';
import '../shared/function/handing_datacontroller.dart';
import '../shared/services/services.dart';
import '../shared/styles/colors.dart';
import '../view/widgets/shared/toast_api.dart';

class CartController extends GetxController {

  CartData cartdata = CartData(Get.find());

   StatusRequest statusRequest=StatusRequest.none;

  MyServices myServices = Get.find();

  List<CartItems> dataCart = [];



 // ignore: prefer_typing_uninitialized_variables
 var total=0.0;




  // List<CartModel> data = [];

  // double priceorders = 0.0;
  //
  // int totalcountitems = 0;

  // ignore: non_constant_identifier_names
  addAndRemove(String ProductId,String quantity ) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.cartData(
      token:myServices.sharedPreferences.getString("token")!,
      productId: ProductId,
      quantity:quantity

    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {

      // Start backend
      if (response['status'] == true) {

        showToast(
            time: 5,
            msg: "The product has been added to the cart",
            backgroundColor:AppColor.defaultColor
        );

        // count=response["data"]["cart_items"];

        print(response);
        return response;

        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }





  getCart() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.getDataCart(
      token: myServices.sharedPreferences.getString("token")!,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == true) {

        List responsedata = response['data']['cart_items'];

        dataCart.clear();

        dataCart.addAll(responsedata.map((e) => CartItems.fromJson(e)));


        if(dataCart.isEmpty)
          {

            statusRequest=StatusRequest.failure;
          }

        total = response["data"]["total"].toDouble();

        print(total);


        print("data");

        // if(dataCart.isEmpty)
        //   {
        //
        //     statusRequest = StatusRequest.failure;
        //
        //   }
        print(dataCart);
      } else {
        statusRequest = StatusRequest.failure;
      }

    }
    // homeController.refresh();

    update();

  }


  removeAllCart() async{

    // statusRequest = StatusRequest.loading;
    var response = await cartdata.deleteAllCartData(
      token:  myServices.sharedPreferences.getString("token")!,
      // productId: id,
    );

    dataCart.remove(response);



    getCart();


    // ignore: unrelated_type_equality_checks
    // data.removeWhere((element) => element.id == favroiteId);


    update();


  }




  resetVarCart() {
    total = 0;
    dataCart.clear();
  }


  goToPageCheckout(){
    if(dataCart.isEmpty) return Get.snackbar("alert", "The cart is empty");

    Get.toNamed(AppRoute.checkout, arguments: {

      "total":total.toString(),
    });

  }



  refreshPage() {
    resetVarCart();
    getCart();
    // update();
  }





  removeCart(String productId) async{

    // statusRequest = StatusRequest.loading;
    var response = await cartdata.deleteCartData(
      token:  myServices.sharedPreferences.getString("token")!,
      id: productId,
      // productId: id,
    );

    // ignore: unrelated_type_equality_checks
    dataCart.removeWhere((element) => element.id == productId);

    // data.removeWhere((element) => element.id == favroiteId);

    getCart();

    update();


  }




  @override
  void onInit() {
    // prefs = await SharedPreferences.getInstance(); // استرداد SharedPreferences

    // view();
    getCart();
    super.onInit();
  }
}