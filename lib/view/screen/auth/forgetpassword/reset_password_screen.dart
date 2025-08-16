import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forget_password/reset_password_controller.dart';
import '../../../../shared/function/valid_input.dart';
import '../../../widgets/shared/default_button.dart';
import '../../../widgets/shared/default_form_field.dart';
import '../../../widgets/shared/handling_dataview.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImplement());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
      ),
      body: GetBuilder<ResetPasswordControllerImplement>(
        builder: (controller) {
          return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget:
             Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formState,
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.03),
                      Text("New Password", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: screenWidth * 0.06)),
                      SizedBox(height: screenHeight * 0.01),
                      Text("Please Enter New Password", style: TextStyle(fontSize: screenWidth * 0.04)),
                      SizedBox(height: screenHeight * 0.03),
                      defaultFormField(
                        label: "New Password",
                        prefix: Icons.lock_outline,
                        type: TextInputType.visiblePassword,
                        suffix: controller.isShowPassword?  Icons.visibility_outlined : Icons.visibility_off_outlined,
                        isPassword: controller.isShowPassword,
                        controller: controller.password,
                        suffixPressed: (){
                          controller.showPassword();
                        },
                        validate: (value) {
                          return validInput(value!, 6, 30, "password");

                        }, hint: 'Enter New Password',
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      defaultFormField(
                        label: "Confirm Password",
                        prefix: Icons.lock_outline,
                        type: TextInputType.visiblePassword,
                        suffix:controller.isShowPassword? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        isPassword: controller.isShowPassword,
                        controller: controller.confirmPassword,
                        suffixPressed: (){
                          controller.showPassword();
                        },
                        validate: (value) {
                          return validInput(value!, 6, 30, "password");

                        }, hint: 'Enter Confirm Password',
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      defaultButton(
                        text: "Save",
                        onPressed: (){

                          controller.goToSuccessResetPassword();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}