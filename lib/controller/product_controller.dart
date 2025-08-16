import 'package:get/get.dart';
import 'package:store_app_advanced/controller/search_product.dart';
import '../data/helper/status_request.dart';
import '../data/remote/product.dart';
import '../models/product_model.dart';
import '../shared/function/handing_datacontroller.dart';
import '../shared/services/services.dart';

abstract class ProductController extends GetxController {
  intialData();
  changeCat(int val, String catval);
  getItems(String categoryid);
  goToPageProductDetails(Products productModel);

}

class ProductControllerImplement extends SearchControllerImplement {
  List categories = [];
  String? catid;
  int? selectedCat;
  Product product = Product(Get.find());


  // ignore: overridden_fields
  @override
  // ignore: overridden_fields
  MyServices myServices = Get.find();



  List data = [];
  @override
  // ignore: overridden_fields
  late String token;

  @override
  // ignore: overridden_fields
  StatusRequest statusRequest = StatusRequest.none;



  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  intialData() {

    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    getItems(catid!);
  }

  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getItems(catid!);
    update();
  }

  getItems(categoryId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await product.getProduct(categoryId,token:myServices.sharedPreferences.getString("token")! );

    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {
        data.addAll(response["data"]['products']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToPageProductDetails(Products productModel) {
    Get.toNamed("productDetails", arguments: {
      "productModel": productModel

      }
    );

  }
}