import 'package:get/get.dart';

import '../shared/constants/routes.dart';
import '../shared/services/services.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  String? image;

  logout() {
    // String userid = myServices.sharedPreferences.getString("id")!;
    // FirebaseMessaging.instance.unsubscribeFromTopic("users");
    // FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }

  Future<void> initialData() async {


    image = myServices.sharedPreferences.getString("image");


  }



}