import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/helper/status_request.dart';
import '../data/remote/cart.dart';
import '../data/remote/search_product.dart';
import '../models/product_model.dart';
import '../models/search_product.dart';
import '../shared/function/handing_datacontroller.dart';
import '../shared/services/services.dart';
import 'cart_controller.dart';



class SearchControllerImplement extends GetxController {

  MyServices myServices = Get.find();

  CartData cartData = CartData(Get.find());


  late Search searchModel;

  var count=1;


  CartController cartController = Get.put(CartController());



  SearchProduct searchProduct= SearchProduct(Get.find());


  late String token;
  StatusRequest statusRequest = StatusRequest.none;



  // ignore: non_constant_identifier_names
  List<Products> Listdata=[];


  bool isSearch = false;
  TextEditingController? search;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchProduct() {
    isSearch = true;
    searchProductData();
    update();
  }




  // late final List<Products> listdata;


  Future<void> initialData() async {
    token = myServices.sharedPreferences.getString("token") ?? "";
    statusRequest = StatusRequest.loading;

    var searchModelArg = Get.arguments['searchModel'];

    if (searchModelArg != null) {
      searchModel = searchModelArg;
      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
  @override
  void onInit() {
    search=TextEditingController();
    initialData();
    searchProductData();


    super.onInit();
  }



  searchProductData() async {
    statusRequest = StatusRequest.loading;
    var response = await searchProduct.searchProductData(
      keywords:  search!.text,
      token: token,
    );

    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {

        Listdata.clear();

        List responsedata = response['data']['products'];


        // products.addAll(response["data"]['products']);

        Listdata.addAll(responsedata.map((e) => Products.fromJson(e)));

        // products.addAll(response["data"]['products']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
    // getData();
  }






}