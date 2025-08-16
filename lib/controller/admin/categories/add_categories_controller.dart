import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/controller/admin/categories/view_categories_controller.dart';

import '../../../data/helper/status_request.dart';
import '../../../data/remote/admin/categories.dart';
import '../../../shared/constants/routes.dart';
import '../../../shared/function/handing_datacontroller.dart';
import '../../../shared/function/uplode_file.dart';
import '../../../shared/services/services.dart';

class CategoriesAddController extends GetxController {
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  Categories categoryData = Categories(Get.find());

  late TextEditingController name;
  late TextEditingController description;
  File? image;

  GlobalKey<FormState> formState = GlobalKey<FormState>();



chooseImage()async{
  image  = await imageUploadGallery();
  update();
}




  Future<void> addData() async {

  if(formState.currentState!.validate()){
    if(image==null)  Get.snackbar("error","Please Choose Image");
    statusRequest = StatusRequest.loading;
    update();

    Map data = {
      "name": name.text,
      "description": description.text,
    };
    var response = await categoryData.addCategory(
      token: myServices.sharedPreferences.getString("token")!,
      data: data,
      image: image,
    );



    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {
        Get.offNamed(AppRoute.categoriesView);

        CategoriesController c=Get.find();
        c.getData();

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  update();
  }

  // goToItems(categories, selectedCat, categoryid) {
  //   Get.toNamed(AppRoute.productCategory, arguments: {
  //
  //     "categories": categories,
  //     "selectedcat": selectedCat,
  //     "catid": categoryid
  //   });
  // }

  // refreshPage() {
  //   addData();
  //   update();
  // }

  @override
  void onInit() {
    name = TextEditingController();
    description = TextEditingController();

    super.onInit();
  }
}
