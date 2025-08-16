import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/shared/styles/colors.dart';
import '../../../../controller/auth/forget_password/verification_code_controller.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../../widgets/shared/handling_dataview.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImplement VerifyCodeController= Get.put(VerifyCodeControllerImplement());



    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Verification"),
      ),
      body:  GetBuilder<VerifyCodeControllerImplement>(
        builder: (controller) {

          return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget:
             Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.03),
                    Text("OTP Verification", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: screenWidth * 0.06)),
                    SizedBox(height: screenHeight * 0.01),
                    Text("Please enter the Digit code send \n To ${controller.email}", style: TextStyle(fontSize: screenWidth * 0.04)),
                    SizedBox(height: screenHeight * 0.05),
                    OtpTextField(
                      borderRadius: BorderRadius.circular(10),
                      fieldWidth: screenWidth * 0.1,
                      focusedBorderColor: AppColor.defaultColor,
                      numberOfFields: 6,
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        print(code);
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
                      onSubmit: (String resetCode){
                        controller.goToResetPassword(resetCode);
                      },
                    ),

                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}