// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/controller/search_product.dart';
import 'package:store_app_advanced/shared/constants/routes.dart';

import '../data/helper/status_request.dart';
import '../data/remote/home.dart';
import '../models/product_model.dart';
import '../shared/function/handing_datacontroller.dart';
import '../shared/services/services.dart';

abstract class HomeController extends SearchControllerImplement {
  @override
  initialData();
  Future<void> getData();

  goToItems(List categories, int selectedCat, String categoryid);

  goToPageProductDetails(Products productModel);

  // goToPageProductDetailsSearch(Search searchModel);

}

// ignore: duplicate_ignore
class HomeControllerImplement extends HomeController {

  @override
  MyServices myServices = Get.find();


  @override
  late String token;
  String? name;
  int? id;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;



  // List<Search> Listdata=[];


  HomeData homeData = HomeData(Get.find());

  // SearchProduct searchProduct= SearchProduct(Get.find());

  List categories = [];

  List products = [];

  // List  searchProducts = [];


  // late final List<Products> Listdata;



  @override
  StatusRequest statusRequest = StatusRequest.none;

  @override
  Future<void> initialData() async {



    token = myServices.sharedPreferences.getString("token") ?? "";
    name = myServices.sharedPreferences.getString("name");
    email = myServices.sharedPreferences.getString("email");
    phone = myServices.sharedPreferences.getString("phone");
    image = myServices.sharedPreferences.getString("image");
    id = myServices.sharedPreferences.getInt("id");
    points = myServices.sharedPreferences.getInt("points");
    credit = myServices.sharedPreferences.getInt("credit");


  }

  @override
  void onInit() {
    search=TextEditingController();
    initialData();
    getData();
    super.onInit();

  }

  @override
  Future<void> getData() async {


    products.clear();

    statusRequest = StatusRequest.loading;
    var response = await homeData.home(
        token: token,

    );

    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {


        myServices.sharedPreferences.setBool("address", response['data']['address']);


        categories.addAll(response["data"]['categories']);
        products.addAll(response["data"]['products']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();

    // getData();
  }


  refreshPage() {
    getData();
    update();
  }




  //  searchProductData() async {
  //   // statusRequest = StatusRequest.loading;
  //   var response = await searchProduct.searchProductData(
  //      keywords:  search!.text,
  //      token: token,
  //   );
  //
  //   print("=============================== Controller $response ");
  //   statusRequest = handlingData(response);
  //   if (statusRequest == StatusRequest.success) {
  //     if (response['status'] == true) {
  //
  //       Listdata.clear();
  //
  //       List responsedata = response['data']['products'];
  //
  //
  //       // products.addAll(response["data"]['products']);
  //
  //       Listdata.addAll(responsedata.map((e) => Search.fromJson(e)));
  //
  //       // products.addAll(response["data"]['products']);
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //
  //   update();
  //   // getData();
  // }


  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.product, arguments: {

      "token":myServices.sharedPreferences.getString("token"),
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }

  @override
  goToPageProductDetails(Products productModel,) {
    Get.toNamed("productDetails", arguments: {
      "productModel": productModel});
  }



  // @override
  // goToPageProductDetailsSearch(Search searchModel) {
  //   Get.toNamed("productDetailsSearch", arguments: {
  //     "searchModel": searchModel});
  //
  // }


  //
  // bool isSearch = false;
  // TextEditingController? search;
  // checkSearch(val) {
  //   if (val == "") {
  //     statusRequest = StatusRequest.none;
  //     isSearch = false;
  //   }
  //   update();
  // }

  // onSearchProduct() {
  //   isSearch = true;
  //   searchProductData();
  //   update();
  // }




}