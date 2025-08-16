import 'package:get/get.dart';
import '../data/helper/http_helper.dart';

// ignore: camel_case_types
class initialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Api()) ;
  }
}