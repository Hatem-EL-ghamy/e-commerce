import 'dart:io';

import '../../helper/http_helper.dart';
import '../../helper/link_api.dart';

class Categories {
  Api api;

  Categories(this.api);

  static const String server = "https://store-project.shop/api/v1";

  Future<dynamic> getCategory() async {
    var response = await api.getData(
      url: ApiLink.category,
    );
    return response.fold((l) => l, (r) => r);
  }

  Future<dynamic> addCategory({
    required Map data,
    File? image,
    String? token,
  }) async {
    var response = await api.addRequestWithImageOne(
      url: ApiLink.addCategory,
      data: data,
      token: token,
      image: image,
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteCategory({
    required String id,
    required String token,
  }) async {
    var response = await api.postData(
      body: {},
      url: "$server/categories/delete-category/${id.toString()}",
      token: token,
    );
    return response.fold((l) => l, (r) => r);
  }

  Future<dynamic> updateCategory({
    required Map data,
    required String id,
    File? image,
    String? token,
  }) async {
    var response;
    if (image == null) {
      response = await api.postData(
        token:token ,
        url: "$server/categories/update-category/${id.toString()}",
        body: data,
      );

    } else {
      response = await api.addRequestWithImageOne(
        url: "$server/categories/update-category/${id.toString()}",
        data: data,
        token: token,
        image: image,
      );

    }
    return response.fold((l) => l, (r) => r);

  }
}
