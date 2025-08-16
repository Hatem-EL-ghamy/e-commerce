import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "name") {
    if (val.isEmpty) {
      return "The name field is required";
    }
    if (!GetUtils.isUsername(val)) {
      return "not valid name";
    }
  }
  if (type == "email") {
    if (val.isEmpty) {
      return "The email field is required";
    }
    if (!GetUtils.isEmail(val)) {
      return "not valid email";
    }


  }


  if (type == "phone") {
    if (val.isEmpty) {
      return "The phone field is required";
    }
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid phone";
    }
  }

  if (val.isEmpty) {
    return "The password field is required";
  }

  if (val.length < min) {
    return "can't be less than $min";
  }

  if (val.length > max) {
    return "can't be larger than $max";
  }
}