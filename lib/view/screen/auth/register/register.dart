import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/shared/function/alertexitapp.dart';
import '../../../../controller/auth/register/register_controller.dart';
import '../../../../shared/function/valid_input.dart';
import '../../../widgets/shared/default_button.dart';
import '../../../widgets/shared/default_form_field.dart';
import '../../../widgets/shared/default_text_button.dart';
import '../../../widgets/shared/handling_dataview.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterControllerImplement());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<RegisterControllerImplement>(
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
                      Text(
                        "Welcome Back",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: screenWidth * 0.06),
                      ),
                      Text(
                        "Register now to browse our hot offers",
                        style: TextStyle(fontSize: screenWidth * 0.045), // set font size based on screen width
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      defaultFormField(
                        controller: controller.name,
                        label: "Name",
                        prefix: Icons.person_outline,
                        type: TextInputType.name,
                        validate: (value) {
                          return validInput(value!, 3, 30, "name");
                        },
                        hint: 'Enter Name',
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      defaultFormField(
                        controller: controller.email,
                        label: "Email Address",
                        prefix: Icons.email_outlined,
                        type: TextInputType.emailAddress,
                        validate: (value) {
                          return validInput(value!, 5, 100, "email");
                        }, hint: 'Enter Email Address ',
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      defaultFormField(
                        label: "Phone",
                        prefix: Icons.phone,
                        type: TextInputType.phone,
                        controller: controller.phone,
                        validate: (value) {
                          return validInput(value!,7,11,"phone");


                        }, hint: 'Enter Phone',


                      ),
                      SizedBox(height: screenHeight * 0.03),
                      GetBuilder<RegisterControllerImplement>(
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


                      SizedBox(height: screenHeight * 0.05),
                      defaultButton(
                        text: "Register",
                        onPressed: () {
                          controller.register();
                        },
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(fontSize: screenWidth * 0.04),
                          ),
                          defaultTextButton(
                            text: "Login Now",
                            onPressed: () {
                              controller.goToLogin();
                            },
                            context: context, // set font size based on screen width
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