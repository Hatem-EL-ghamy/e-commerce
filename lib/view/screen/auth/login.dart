import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../shared/constants/image_assets.dart';
import '../../../shared/function/alertexitapp.dart';
import '../../../shared/function/valid_input.dart';
import '../../widgets/shared/default_button.dart';
import '../../widgets/shared/default_form_field.dart';
import '../../widgets/shared/default_text_button.dart';
import '../../widgets/shared/handling_dataview.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImplement());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImplement>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formState,
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.03),
                      Image(
                        image: const AssetImage(AppImageAsset.logo),
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.5,
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Text(
                        "Welcome Back",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: screenWidth * 0.06),
                      ),
                       Text("Login now to browse our hot offers", style: TextStyle(
                          fontSize: screenWidth * 0.045,
                      )),
                      SizedBox(height: screenHeight * 0.03),
                      defaultFormField(
                        controller: controller.email,
                        label: "Email Address",
                        prefix: Icons.email_outlined,
                        type: TextInputType.emailAddress,
                        validate: (value) {
                          return validInput(value!, 5, 100, "email");
                        }, hint: 'Enter Email Address',
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      GetBuilder<LoginControllerImplement>(
                        builder: (controller) => defaultFormField(
                          controller: controller.password,
                          label: "Password",
                          prefix: Icons.lock_outline,
                          type: TextInputType.visiblePassword,
                          suffix: controller.isShowPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          isPassword: controller.isShowPassword,
                          suffixPressed: () {
                            controller.showPassword();
                          },
                          validate: (value) {

                            return validInput(value!, 5, 30, "password");
                          }, hint: 'Enter Password',
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.goToForgetPassword();
                            },
                            child: Text(
                              "Forget Password",
                              style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      defaultButton(
                        text: "Login",
                        onPressed: () {
                          controller.login();
                        },
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(fontSize: screenWidth * 0.04),
                          ),
                          defaultTextButton(
                            text: "Register Now",
                            onPressed: () {
                              controller.goTORegister();
                            }, context: context,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}