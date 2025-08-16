import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';


import 'package:dartz/dartz.dart';
import 'package:store_app_advanced/data/helper/status_request.dart';

import '../../shared/function/check_internet.dart';

class Api {
  Future<Either<StatusRequest, Map>> getData({
    required String url,
    String? token,
    Map<String, String>? body,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/json',

    });
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }

    if (await checkInternet()) {
      http.Response response = await http.get(Uri.parse(url), headers: headers,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);
        print(data);
        return Right(data);
      } else {
        return const Left(StatusRequest.serverFailed);
      }
    } else {
      return const Left(StatusRequest.offlineFailed);
    }
  }

  Future<Either<StatusRequest, Map>> postData({
    required String url,
    required dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/json',
    });

    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }

    if (await checkInternet()) {
      http.Response response = await http.post(Uri.parse(url),
          body: jsonEncode(body),
        headers: headers,
      );


      print(response.statusCode);

      if (response.statusCode == 201 || response.statusCode == 200) {
        Map<String,dynamic> data = jsonDecode(response.body);
        print(data);
        return Right(data);
      } else {
        return const Left(StatusRequest.serverFailed);
      }
    } else {
      return const Left(StatusRequest.offlineFailed);
    }
  }

  Future<Either<StatusRequest, Map<String, dynamic>>> putData({
    required String url,
    required dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/json',

    });
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }

    if ( await checkInternet()) {
      http.Response response = await http.put(Uri.parse(url),
          body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);
        print(data);
        return right(data);
      } else {
       return left(StatusRequest.serverFailed);
      }

    } else {
      return left(StatusRequest.offlineFailed);
    }


  }

  Future<Either<StatusRequest, Map>> addRequestWithImageOne(

  { required String url,
  required Map data,
  File? image,
  String? token,
// dynamic nameRequest,
  }

      )

  async {
    // nameRequest ??= "files";

    var uri = Uri.parse(url);

    var request = http.MultipartRequest("POST", uri);



    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/json',
    });
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }

    request.headers.addAll(headers);

    if (image != null) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartFile = http.MultipartFile("image", stream, length,
          filename: basename(image.path));
      request.files.add(multipartFile);
    }

    // add Data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    // add Data to request
    // Send Request
    var myrequest = await request.send();
    // For get Response Body
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      return Right(responseBody);
    } else {
      return const Left(StatusRequest.serverFailed);
    }
  }



}
