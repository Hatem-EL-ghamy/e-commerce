import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/settings_controller.dart';
import '../../shared/constants/routes.dart';
import '../../shared/styles/colors.dart';

class SettingsScreen extends StatelessWidget {
   SettingsScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return ListView(

      children: [
        const SizedBox(height: 10),

        const Text("Settings",textAlign: TextAlign.center,style: TextStyle(color: AppColor.gray,fontSize: 24)),

        const SizedBox(height: 30),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            // ListTile(
            //   // onTap: () {},
            //   trailing: Switch(onChanged: (val) {}, value: true),
            //   title: const Text("Disable Notificatios"),
            // ),
            // ListTile(
            //   onTap: () {
            //     // Get.toNamed(AppRoute.orderspending);
            //   },
            //   trailing: const Icon(Icons.password),
            //   title: const Text("change password",style: TextStyle(fontSize: 18)),
            // ),
            ListTile(
              onTap: () {
                Get.toNamed(AppRoute.addressView);
              },
              trailing: const Icon(Icons.location_on_outlined),
              title: const Text("Address",style: TextStyle(fontSize: 18)),
            ),
            ListTile(
              onTap: () {
                Get.toNamed(AppRoute.orderPending);
              },
              trailing: const Icon(Icons.card_travel),
              title: const Text("Orders",style: TextStyle(fontSize: 18)),
            ),
            // ListTile(
            //   onTap: () {
            //     // Get.toNamed(AppRoute.ordersarchive );
            //   },
            //   trailing: const Icon(Icons.card_travel),
            //   title: const Text("Archive",style: TextStyle(fontSize: 18)),
            // ),

            ListTile(
              onTap: () {},
              trailing: const Icon(Icons.phone_callback_outlined),
              title: const Text("About us",style: TextStyle(fontSize: 18)),
            ),
            ListTile(
              onTap: () {
                launchUrl(Uri.parse("tel:+201124668697"));

                   },



             trailing: Icon(Icons.rate_review_outlined),
               title: Text("Contact us",style: TextStyle(fontSize: 18)),
            ),
            ListTile(
              onTap: () {
                controller.logout();
              },
              title: Text("Logout",style: TextStyle(fontSize: 18)),
              trailing: Icon(Icons.exit_to_app),
            ),
          ]),
        )
      ],
    );
  }
}