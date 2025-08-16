import 'package:get/get.dart';

import '../../../data/helper/status_request.dart';
import '../../../data/remote/admin/categories.dart';
import '../../../models/categories_model.dart';
import '../../../shared/constants/routes.dart';
import '../../../shared/function/handing_datacontroller.dart';
import '../../../shared/services/services.dart';

class CategoriesController extends GetxController {
  MyServices myServices = Get.find();

  Categories categoryData = Categories(Get.find());

  List<CategoriesData> data = [];

  StatusRequest statusRequest = StatusRequest.none;

  Future<void> getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoryData.getCategory();

    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {
        List dataList = response["data"]['data'];

        data.addAll(dataList.map((e) => CategoriesData.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  removeCategory(String productId) async {
    statusRequest = StatusRequest.loading;

    update();

    var response = await categoryData.deleteCategory(
      token: myServices.sharedPreferences.getString("token")!,
      id: productId,
      // productId: id,
    );

    // ignore: unrelated_type_equality_checks
    data.removeWhere((element) => element.id == productId);

    getData();

    update();
  }

  goToPageUpdate(CategoriesData categoryModel) {
    Get.toNamed(AppRoute.categoriesUpdate, arguments: {
      "categoryModel": categoryModel,
    });
  }

  refreshPage() {
    getData();
    update();
  }

  myBack() {
    Get.offAllNamed(AppRoute.homeAdmin);
  }

  @override
  void onInit() {
    super.onInit();
    // initialData();
    getData();
  }
}
