import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/shared/constants/routes.dart';
import '../../../../controller/admin/categories/view_categories_controller.dart';
import '../../../widgets/admin/list_category_Item.dart';
import '../../../widgets/shared/handling_dataview.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesController());

    return GetBuilder<CategoriesController>(builder: (controller) {
      return RefreshIndicator(
        onRefresh: () async {
          await controller.refreshPage();

          return Future.delayed(const Duration(
              seconds:
              1)); // Delay the completion of the refresh to show the indicator
        },
        child: HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: WillPopScope(
            onWillPop: () {
              return controller.myBack();
            },
            child: Scaffold(
              floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.categoriesAdd);
                  }, child: const Icon(Icons.add)),
              appBar: AppBar(title: const Text("Categories")),
              body: Column(
                children: const [
                  ListCategory(),
                  SizedBox(height: 40,),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
