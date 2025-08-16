// import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/helper/status_request.dart';
import '../../data/remote/auth/update_profile.dart';
import '../../shared/function/handing_datacontroller.dart';
import '../../shared/services/services.dart';
import '../../shared/styles/colors.dart';
import '../../view/widgets/shared/toast_api.dart';

 class ProfileController extends GetxController {
   MyServices myServices = Get.find();
   StatusRequest statusRequest = StatusRequest.none;


   late String token;
   String? name;
   int? id;
   String? email;
   String? phone;
   String? image;
   int? points;
   int? credit;


   // File? image;



   var nameController=TextEditingController();
   var emailController=TextEditingController();
   var phoneController=TextEditingController();


   GlobalKey<FormState> formState = GlobalKey<FormState>();


   UpdateProfileData updateProfile = UpdateProfileData(Get.find()) ;



   Future<void> initialData() async {


     token = myServices.sharedPreferences.getString("token") ?? "";
     name = myServices.sharedPreferences.getString("name");
     email = myServices.sharedPreferences.getString("email");
     phone = myServices.sharedPreferences.getString("phone");
     image = myServices.sharedPreferences.getString("image");
     id = myServices.sharedPreferences.getInt("id");
     points = myServices.sharedPreferences.getInt("points");
     credit = myServices.sharedPreferences.getInt("credit");

   }



   ubdate() async {
     if (formState.currentState!.validate()) {
       statusRequest = StatusRequest.loading;
       update();

       var response = await updateProfile.updateProfile(
         token: myServices.sharedPreferences.getString("token")!,
         name: nameController.text,
         phone: phoneController.text,
         email: emailController.text,
       );

       print("=============================== Controller $response ");
       statusRequest = handlingData(response);
       if (statusRequest == StatusRequest.success) {
         if (response['status'] == true) {

           showToast(
               msg: "Profile updated successfully",
               backgroundColor:AppColor.defaultColor
           );

         } else {
           statusRequest = StatusRequest.failure;
         }
       }
       update();
     }
     update();
   }

   @override
   void onInit() {
     initialData();
     nameController.text =myServices.sharedPreferences.getString("name")!  ;
     phoneController.text = myServices.sharedPreferences.getString("phone")!;
     emailController.text = myServices.sharedPreferences.getString("email")! ;

     super.onInit();
   }
   @override
  void dispose() {
     nameController.dispose();
     phoneController.dispose();
     emailController.dispose();


     super.dispose();
   }

 }



