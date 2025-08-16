import 'package:get/get.dart';


import '../data/helper/status_request.dart';
import '../data/remote/favorite.dart';
import '../shared/function/handing_datacontroller.dart';
import '../shared/services/services.dart';
import '../shared/styles/colors.dart';
import '../view/widgets/shared/toast_api.dart';

class FavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  Map isFavorite = {};

//  key => id items
//  Value => 1 OR 0

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String id) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.favoriteData(
      token:  myServices.sharedPreferences.getString("token")!,
      productId: id,
        );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == true) {
        showToast(
          time: 5,
            msg: "The product has been added to your favourites",
            backgroundColor:AppColor.defaultColor
        );
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  removeFavorite(String id) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.favoriteData(
      token:  myServices.sharedPreferences.getString("token")!,
      productId: id,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == true) {
        showToast(
          time: 5,

            msg: "The product has been deleted to your favourites",
            backgroundColor:AppColor.gray,
        );
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
  }




}