import 'package:get/get.dart';

import '../data/helper/status_request.dart';
import '../data/remote/category.dart';
import '../shared/constants/routes.dart';
import '../shared/function/handing_datacontroller.dart';
import '../shared/services/services.dart';

abstract class CategoryController extends GetxController {
  Future<void> initialData();
  Future<void> getData();

  goToItems(List categories, int selectedCat, String categoryid);

}

class CategoryControllerImplement extends CategoryController {
  MyServices myServices = Get.find();


  CategoryData categoryData = CategoryData(Get.find());

  List categories = [];



  StatusRequest statusRequest = StatusRequest.none;

  @override
  Future<void> initialData() async {

  }

  @override
  void onInit() {
    super.onInit();
    initialData();
    getData();
  }

  @override
  Future<void> getData() async {
    statusRequest = StatusRequest.loading;
    var response = await categoryData.category();

    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {

        categories.addAll(response["data"]['data']);
        // products.clear();
        // products.addAll(response["data"]['products']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.productCategory, arguments: {

      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }


  refreshPage() {
    getData();
    update();
  }


}


