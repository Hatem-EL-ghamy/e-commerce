import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/shared/constants/routes.dart';
import '../../data/remote/auth/login.dart';
import '../../data/helper/status_request.dart';
import '../../shared/function/handing_datacontroller.dart';
import '../../shared/services/services.dart';

abstract class LoginController extends GetxController {
  // ignore: non_constant_identifier_names
  login();
  goTORegister();
  goToForgetPassword();

}

class LoginControllerImplement extends LoginController{
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  bool isShowPassword=true;

  StatusRequest statusRequest=StatusRequest.none;
  LoginData loginData = LoginData(Get.find()) ;
  MyServices myServices = Get.find();


  showPassword(){
    isShowPassword=!isShowPassword;
    update();
  }

  @override
  login() async {
    if (formState.currentState!.validate()) {
      statusRequest=StatusRequest.loading;
      update();

      var response= await loginData.userLogin(
        email: email.text,
        password: password.text,
      );
      print("=============================== Controller $response ") ;
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {

        if(response["status"]==true)
          {

            Get.defaultDialog(
                title: "success",

                middleText: "Login done successfully");

            myServices.sharedPreferences.setInt("id", response['data']['id']);
            myServices.sharedPreferences.setString("name", response['data']['name']) ;
            myServices.sharedPreferences.setString("email", response['data']['email']) ;
            myServices.sharedPreferences.setString("phone", response['data']['phone']) ;
            myServices.sharedPreferences.setString("image", response['data']['image']) ;
            myServices.sharedPreferences.setString("token", response['data']['token']) ;
            myServices.sharedPreferences.setInt("points", response['data']['points']);
            myServices.sharedPreferences.setInt("credit", response['data']['credit']);
            myServices.sharedPreferences.setString("role", response['data']['role']) ;

//======================LoginUser========================

            if(myServices.sharedPreferences.getString("role") == "user")
            {
              myServices.sharedPreferences.setString("step","2") ;

              Get.offAllNamed(AppRoute.layout, arguments: {

                "token":myServices.sharedPreferences.getString("token"),
              }
              );
            }
            //==============================================

       //======================LoginAdmin========================

            if(myServices.sharedPreferences.getString("role") == "admin")
            {
              // myServices.sharedPreferences.setString("step","3") ;

              Get.offAllNamed(AppRoute.homeAdmin, arguments: {
                "token":myServices.sharedPreferences.getString("token"),
              }
              );
            }
          }
      }
      else{
        Get.defaultDialog(
            title: "Error",
            middleText: "Email Or password Not Correct");
        statusRequest = StatusRequest.failure;
      }
      // update();
    }
    update();
  }


  @override
  goTORegister() {
    Get.offNamed(AppRoute.register);
  }

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print("tokenFirebaseMessaging $value");
    //   // String? token = value;
    // });

    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgerPassword);
  }

}