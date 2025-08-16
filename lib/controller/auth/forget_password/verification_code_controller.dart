import 'package:get/get.dart';

import '../../../data/helper/status_request.dart';
import '../../../data/remote/auth/forget_password/check_reset_code.dart';
import '../../../shared/constants/routes.dart';
import '../../../shared/function/handing_datacontroller.dart';
import '../../../shared/styles/colors.dart';
import '../../../view/widgets/shared/toast_api.dart';

abstract class VerificationCodeController extends GetxController {
  checkCode();
  goToResetPassword(String code);
}

class VerifyCodeControllerImplement extends VerificationCodeController {

  StatusRequest statusRequest=StatusRequest.none;
  String?email;

  ResetCodeData resetCodeData = ResetCodeData(Get.find()) ;
  @override
  checkCode() {}

  @override
  goToResetPassword( String code) async {
    statusRequest=StatusRequest.loading;
    update();
    var response= await resetCodeData.ResetCode(
      email: email!,
      code:code ,
    );


    print("=============================== Controller $response ") ;
    statusRequest=handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // data.reactive(response['data']);
      Get.offAllNamed(AppRoute.resetPassword,arguments: {
        "email":email,
        "code":code,
      });
      // Get.delete<VerificationCodeRegisterControllerImplement>();
    }
    else{

      showToast(
          msg: "Verify Code Not Correct",
          backgroundColor:AppColor.red
      );

      statusRequest=StatusRequest.failure;
    }
    update();


  }

  @override
  void onInit() {
    email =Get.arguments['email'];
    super.onInit();
  }


}