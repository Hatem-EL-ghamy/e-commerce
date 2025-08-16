import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/shared/constants/routes.dart';

import '../../../shared/constants/image_assets.dart';
import '../../widgets/admin/card_admin_home.dart';

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView(
        children: [
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 160),
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              CardAdminHome(
                  url: AppImageAsset.categories,
                  title: 'Categories ',
                  onTap: () {
                    Get.toNamed(AppRoute.categoriesView);
                  }),
              CardAdminHome(
                  url: AppImageAsset.box, title: 'Product', onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
