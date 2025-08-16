import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:store_app_advanced/shared/constants/routes.dart';

import '../../data/helper/status_request.dart';
import '../../shared/services/services.dart';

class MapController extends GetxController{

  StatusRequest statusRequest = StatusRequest.loading;
  MyServices myServices = Get.find();

  // ignore: prefer_typing_uninitialized_variables
  late bool address;

   Completer<GoogleMapController>? completerController =
  Completer<GoogleMapController>();


   CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );


  List<Marker> markers = [];

  double? lat;
  double? long;

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }


  goToPageAddDetailsAddress(){

    Get.toNamed(AppRoute.addressAdd,arguments: {
      "lat":  lat.toString(),
      "long" :long.toString()

    });
  }



  goToPageUpdateDetailsAddress(){

    Get.toNamed(AppRoute.addressUpdate,arguments: {
      "lat":  lat.toString(),
      "long" :long.toString()

    });
  }


   Position? postion;

   getCurrentLocation() async {
     postion = await Geolocator.getCurrentPosition();
     kGooglePlex = CameraPosition(
       target: LatLng(postion!.latitude, postion!.longitude),
       zoom: 14.4746,
     );
     statusRequest = StatusRequest.none;
     update();
   }



  Future<void> initialData() async {

    address = myServices.sharedPreferences.getBool("address")!;

  }






@override
  void onInit() {
  initialData();
  getCurrentLocation();
  completerController=Completer<GoogleMapController>();
    super.onInit();
  }

}
