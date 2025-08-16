import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/helper/status_request.dart';
import '../../../data/remote/auth/forget_password/reset_password.dart';
import '../../../shared/constants/routes.dart';
import '../../../shared/function/handing_datacontroller.dart';
import '../../../shared/styles/colors.dart';
import '../../../view/widgets/shared/toast_api.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImplement extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController confirmPassword;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest=StatusRequest.none;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find()) ;
  bool isShowPassword=true;
  showPassword(){
    isShowPassword=!isShowPassword;
    update();
  }

  String?email;
  String?code;
  @override
  resetPassword()  {
  }

  @override
  goToSuccessResetPassword() async {
    if(password.text !=confirmPassword.text) {
      return  showToast(
          msg: "The password does not match",
          backgroundColor:AppColor.red
      );
    }
    statusRequest=StatusRequest.loading;
    update();
    var response= await resetPasswordData.ResetPassword(
      email: email!,
      code:code! ,
      password: password.text,
    );

    print("=============================== Controller $response ") ;
    statusRequest=handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // data.reactive(response['data']);
      Get.offAllNamed(AppRoute.successResetPassword);
      // Get.delete<VerificationCodeRegisterControllerImplement>();
    }
    else{
      showToast(
          msg: "Try Again",
          backgroundColor:AppColor.red
      );
      statusRequest=StatusRequest.failure;
    }
    update();
  }
  @override
  void onInit() {
    email =Get.arguments['email'];
    code =Get.arguments['code'];
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }
}