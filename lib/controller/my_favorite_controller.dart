import 'package:get/get.dart';

import '../data/helper/status_request.dart';
import '../data/remote/favorite.dart';
import '../data/remote/my_favorite.dart';
import '../models/favoritge_model.dart';
import '../shared/function/handing_datacontroller.dart';
import '../shared/services/services.dart';
import 'favorite_controller.dart';
import 'home_controller.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());

  List<FavoritesPorduct> data = [];

  HomeControllerImplement homeController = Get.put(HomeControllerImplement());

  FavoriteController favoriteController = Get.put(FavoriteController());

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  // FavoriteData favorite = FavoriteData(Get.find());

  // Map isFavorite = {};

//  key => id items
//  Value => 1 OR 0

  // setFavorite(id, val) {
  //   isFavorite[id] = val;
  //   update();
  // }

  goToPageProductDetails(
    FavoriteData productModel,
  ) {
    Get.toNamed("productDetails", arguments: {"FavoriteData": productModel});
  }

  getFavorite() async {
    data.clear();

    statusRequest = StatusRequest.loading;
    var response = await favoriteData.getFavoriteData(
      token: myServices.sharedPreferences.getString("token")!,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == true) {
        List responsedata = response['data']['favorites_porduct'];

        print(responsedata);

        data.addAll(responsedata.map((e) => FavoritesPorduct.fromJson(e)));

        print("data");

        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }

        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    homeController.refresh();

    update();
  }

  removeFavorite(String favroiteId) async {
    // statusRequest = StatusRequest.loading;
    var response = await favoriteData.deleteFavoriteData(
      token: myServices.sharedPreferences.getString("token")!,
      id: favroiteId,
      // productId: id,
    );

    data.removeWhere((element) => element.idFav == favroiteId);

    getFavorite();

    // data.remove(myServices.sharedPreferences.getString("token")!,);

    // showToast(
    //   time: 5,
    //   msg: "The product has been deleted to your favourites",
    //   backgroundColor:AppColor.gray,
    // );
    update();
  }

  // removeFavorite(String id)  {
  //   data.clear();
  //   statusRequest = StatusRequest.loading;
  //
  //   var response =  favorite.favoriteData(
  //     token:  myServices.sharedPreferences.getString("token")!,
  //     productId: id,
  //   );
  //   print("=============================== Controller $response ");
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     // Start backend
  //       showToast(
  //         time: 5,
  //         msg: "The product has been deleted to your favourites",
  //         backgroundColor:AppColor.gray,
  //       );
  //       // data.addAll(response['data']);
  //     // End
  //   } else {
  //     statusRequest = StatusRequest.failure;
  //   }
  //   update();
  // }

  //
  // changeFavorite(String id) async {
  //   // data.clear();
  //   statusRequest = StatusRequest.loading;
  //   var response = await favoriteData.favoriteData(
  //     token:  myServices.sharedPreferences.getString("token")!,
  //     productId: id,
  //   );
  //   print("=============================== Controller $response ");
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     // Start backend
  //     if (response['status'] == true) {
  //       showToast(
  //         time: 5,
  //
  //         msg: "The product has been deleted to your favourites",
  //         backgroundColor:AppColor.gray,
  //       );
  //       // data.addAll(response['data']);
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //     // End
  //   }
  // }

  @override
  void onInit() {
    getFavorite();
    super.onInit();
  }
}
