import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/helper/status_request.dart';
import '../data/remote/cart.dart';
import '../models/cart_model.dart';
import '../models/product_model.dart';
import '../shared/function/handing_datacontroller.dart';
import '../shared/services/services.dart';
import '../shared/styles/colors.dart';
import '../view/widgets/shared/toast_api.dart';
import 'cart_controller.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImplement extends ProductDetailsController {


  late SharedPreferences prefs;

  late Products productModel;


  CartController cartController = Get.put(CartController());

  CartData cartdata = CartData(Get.find());

  StatusRequest statusRequest=StatusRequest.none;

  MyServices myServices = Get.find();

  List<CartItems> dataCart = [];


  int count = 1;

  late String countKey;




  intialData() async{
    productModel = Get.arguments['productModel'];

    prefs = await SharedPreferences.getInstance(); // Initialize prefs here

    statusRequest = StatusRequest.loading;


    countKey = '${productModel.id}count'; //
    // تعيين مفتاح الـ count الخاص بالمنتج
    count = prefs.getInt(countKey) ?? 1; // استرداد قيمة الـ count المحفوظة، إذا لم يتم العثور على القيمة، يتم تعيينها إلى 1
    statusRequest = StatusRequest.success;
    update();

    statusRequest = StatusRequest.success;
    update();
    // favoritesModel=Get.arguments['favoritesModel'];
  }





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



  add() {
 count++;
 // prefs.setInt(countKey, count); // حفظ قيمة الـ count الجديدة في SharedPreferences

 update();
  }

  remove() {
    if (count > 1) {
    count--;
      update();
    }
  }

  addTOCart() async
  {


    prefs.setInt(countKey, count); // حفظ قيمة الـ count الجديدة في SharedPreferences

    prefs = await SharedPreferences.getInstance(); //

  }

  @override
  void onInit() async{
    intialData();

    // prefs.setInt(countKey, count); // حفظ قيمة الـ count الجديدة في SharedPreferences

    super.onInit();
  }
}