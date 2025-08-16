import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/shared/constants/routes.dart';

import '../../../data/helper/status_request.dart';
import '../../../data/remote/auth/forget_password/forget.dart';
import '../../../shared/function/handing_datacontroller.dart';
import '../../../shared/styles/colors.dart';
import '../../../view/widgets/shared/toast_api.dart';

abstract class ForgetPasswordController extends GetxController {
  // ignore: non_constant_identifier_names
  checkEmail();

}

class ForgetControllerImplement extends ForgetPasswordController{
  late TextEditingController email;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  ForgetData forgetData = ForgetData(Get.find()) ;
  StatusRequest statusRequest=StatusRequest.none;


  @override
  checkEmail() async {

    if (formState.currentState!.validate()) {
      statusRequest=StatusRequest.loading;
      update();

      var response= await forgetData.ForgetPassword(
        email: email.text,
      );

      print("=============================== Controller $response ") ;
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        Get.offNamed(AppRoute.verificationCode , arguments: {
          "email":email.text,
        });
      }
      else{

        showToast(
            msg: "Email Not found",
            backgroundColor:AppColor.red
        );
        statusRequest=StatusRequest.failure;
        // Get.defaultDialog(title: "ُWarning" , middleText: " Email Or password Not Correct") ;

      }
      update();
    }
    else {}
    update();
  }


  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

}