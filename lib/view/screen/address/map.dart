import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:store_app_advanced/view/widgets/shared/handling_dataview.dart';

import '../../../controller/address/map_controller_address.dart';
import '../../widgets/shared/default_button.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    MapController controllerPage=Get.put(MapController());
    return Scaffold(
      // appBar: AppBar(
      //     title: const Text(
      //       "Add New Address",
      //       style: TextStyle(color: AppColor.gray, fontSize: 20),
      //     )),

     body: GetBuilder<MapController>(
       builder: (controllerPage) {
         return HandlingDataView(
           statusRequest: controllerPage.statusRequest,
           widget:
            Column(
             children: [
               // ignore: unnecessary_null_comparison
               if(controllerPage.kGooglePlex != null)    Expanded(
                 child: Stack(
                   alignment: Alignment.bottomCenter,
                   children: [
                     GoogleMap(
                       mapType: MapType.normal,
                       initialCameraPosition: controllerPage.kGooglePlex,
                       onTap: (latLong){
                         controllerPage.addMarkers(latLong);
                       },
                       markers:controllerPage.markers.toSet() ,
                       onMapCreated: (GoogleMapController controllerMap) {
                         controllerPage.completerController!.complete(controllerMap);
                       },
                     ),

                     Container(
                       padding: const EdgeInsets.only(bottom: 10),
                       child: defaultButton(
                           text: 'completion',
                           width: 200,
                           height: 40,
                           onPressed: () {

                             if(controllerPage.address==true)
                               {
                                 controllerPage.goToPageUpdateDetailsAddress();

                               }

                             else{
                               controllerPage.goToPageAddDetailsAddress();

                             }


                           }
                       ),
                     ),
                   ],
                 ),
               ),

             ],
           ),
         );
       }
     ),

    );
  }
}


// AIzaSyBjUkDs59q6R2-3Q3cLqt_sYHsZ6OMsX7U
