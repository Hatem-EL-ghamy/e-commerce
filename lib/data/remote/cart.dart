import '../helper/http_helper.dart';
import '../helper/link_api.dart';

class CartData {
  Api api;
  CartData(this.api);
  static const String server="https://store-project.shop/api/v1";

  Future<dynamic> cartData(

      {required String productId ,required String token,required String quantity  } ) async {
    var response = await api.postData(
      url: ApiLink.addAndRemoveCart,
      token: token,
      body: {
        "product_id":productId.toString(),
        "quantity":quantity,

      },
    );
    return response.fold((l) => l, (r) => r);
  }

  Future<dynamic> getDataCart({required String token}) async {
    var response = await api.getData(url: ApiLink.getCart, token: token);
    return response.fold((l) => l, (r) => r);
  }



  deleteCartData(

      {required String id,required String token, } ) async {
    var response = await api.postData(
      body: {},
      url:"$server/carts/delete/${id.toString()}",
      token: token,
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteAllCartData(

      {required String token, } ) async {
    var response = await api.postData(
      body: {},
      url:"$server/carts/delete-all",
      token: token,
    );
    return response.fold((l) => l, (r) => r);
  }


}