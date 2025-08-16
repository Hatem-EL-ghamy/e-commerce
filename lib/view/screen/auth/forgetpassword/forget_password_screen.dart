import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/shared/constants/routes.dart';
import '../../../../controller/auth/forget_password/forget_password_controller.dart';
import '../../../../shared/function/valid_input.dart';
import '../../../widgets/shared/default_button.dart';
import '../../../widgets/shared/default_form_field.dart';
import '../../../widgets/shared/default_text_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetControllerImplement controller= Get.put(ForgetControllerImplement());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Forget Password"),
      ),
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formState,
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.03),
                Text("Forget Password",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: screenWidth * 0.05)),
                SizedBox(height: screenHeight * 0.01),
                Text("Please enter email and we will send \n you a code to return to you account.", style: TextStyle(fontSize: screenWidth * 0.04)),
                SizedBox(height: screenHeight * 0.05),
                defaultFormField(
                  label: "Email Address",
                  prefix: Icons.email_outlined,
                  controller: controller.email,
                  validate: (value) {
                    return validInput(value!, 5, 100, "email");
                  },
                  type: TextInputType.emailAddress,
                  hint: 'Enter Email Address',
                ),
                SizedBox(height: screenHeight * 0.05),
                defaultButton(
                  text: "Send",
                  onPressed: (){
                    controller.checkEmail();
                  },
                ),
                SizedBox(height: screenHeight * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(
                      'Don\'t have an account?',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: screenWidth * 0.04),
                    ),

                    defaultTextButton(
                      text: "Register Now",
                      onPressed: (){
                        Get.toNamed(AppRoute.register);
                      },
                      context: context,


                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}