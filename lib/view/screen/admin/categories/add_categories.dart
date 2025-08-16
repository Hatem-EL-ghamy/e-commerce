import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/view/widgets/shared/handling_dataview.dart';
import '../../../../controller/admin/categories/add_categories_controller.dart';
import '../../../../shared/function/valid_input.dart';
import '../../../../shared/styles/colors.dart';
import '../../../widgets/shared/default_button.dart';
import '../../../widgets/shared/default_form_field.dart';



class AddCategories extends StatelessWidget {
  const AddCategories({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesAddController());
    return Scaffold(
      appBar: AppBar(title: const Text("Add Category")),
      body: GetBuilder<CategoriesAddController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget:
             Container(
               padding: const EdgeInsets.all(16),
              child: Form(
                key: controller.formState,
                child: ListView(
                  children: [
                    defaultFormField(
                      controller: controller.name,
                      label: "category Name",
                      prefix: Icons.person_outline,
                      type: TextInputType.name,
                      validate: (value) {
                        return validInput(value!, 3, 30, "");
                      },
                      hint: 'Enter category Name',
                    ),
                    const SizedBox(height: 20,),

                    defaultFormField(
                      controller: controller.description,
                      label: "description",
                      prefix: Icons.person_outline,
                      type: TextInputType.text,
                      validate: (value) {
                        return validInput(value!, 3, 30, "");
                      },
                      hint: 'Enter description',
                    ),

                    const SizedBox(height: 30,),

                    defaultButton(
                      backGround: AppColor.gray1,
                      text: "Choose Category Image",
                      onPressed: () {
                        controller.chooseImage();
                      },
                    ),
                    const SizedBox(height: 10,),

                    if(controller.image != null)

                      Image.file(controller.image!),

                    const SizedBox(height: 40,),
                    defaultButton(
                      text: "Add",
                      onPressed: () {
                        controller.addData();
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
