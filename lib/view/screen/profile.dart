import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/view/widgets/shared/handling_dataview.dart';

import '../../controller/auth/profile_controller.dart';
import '../../shared/function/valid_input.dart';
import '../../shared/styles/colors.dart';
import '../widgets/shared/default_button.dart';
import '../widgets/shared/default_form_field.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
   const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "My Profile",
        style: TextStyle(color: AppColor.gray, fontWeight: FontWeight.w900),
      )),
      body: GetBuilder<ProfileController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formState,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const SizedBox(height: 20,),

                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: AppColor.defaultColor,
                          borderRadius: BorderRadius.circular(100)

                      ),
                      child: CircleAvatar(
                        radius: 90,
                        backgroundColor: Colors.black,
                        backgroundImage:  NetworkImage("${controller.image}"),

                      ),
                    ),
                    const SizedBox(height: 40,),
                    defaultFormField(
                      label: "name",
                      prefix: Icons.person,
                      validate: (value) {
                        return validInput(value!, 3, 100, "name");
                      },
                      controller: controller.nameController,
                      type: TextInputType.name,
                      hint: 'Enter Name',
                      radius: 16,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    defaultFormField(
                      label: "email",
                      prefix: Icons.email,
                      validate: (value) {
                        return validInput(value!, 5, 100, "email");
                      },
                      controller: controller.emailController,
                      type: TextInputType.emailAddress,
                      hint: 'Enter Email Address ',
                      radius: 16,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    defaultFormField(
                      label: "phone",
                      prefix: Icons.phone,
                      validate: (value) {
                        return validInput(value!, 7, 11, "phone");
                      },
                      controller: controller.phoneController,
                      type: TextInputType.phone,
                      hint: 'Enter Phone',
                      radius: 16,
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    defaultButton(
                      text: "update",
                      onPressed: () {
                        controller.ubdate();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
