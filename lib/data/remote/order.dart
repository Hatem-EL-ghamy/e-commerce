import '../helper/http_helper.dart';
import '../helper/link_api.dart';

class OrderData {
  Api api;

  static const String server="https://store-project.shop/api/v1";


  OrderData(this.api);

  Future<dynamic> addOrder({
    required String token,
    // ignore: non_constant_identifier_names
    required String address_id,
    // ignore: non_constant_identifier_names
    required String payment_method,
    required String total,

    // ignore: non_constant_identifier_names
    required String order_type,

    // ignore: non_constant_identifier_names
    required String cost_delivery,

  }) async {
    var response = await api.postData(
      token: token,
      url: ApiLink.addOrder,
      body: {
        "address_id": address_id,
        "payment_method": payment_method,
        "total": total,
        "order_type": order_type,
        "cost_delivery": cost_delivery,

      },
    );
    return response.fold((l) => l, (r) => r);
  }


  Future<dynamic> getOrdersPending ({
  required String token,

}) async {
  var response = await api.getData(
    token: token,
    url: ApiLink.getOrder,

  );
  return response.fold((l) => l, (r) => r);
}







  getOrdersDetails(

      {required String id,required String token, } ) async {
    var response = await api.getData(
      url:"$server/carts/delete/${id.toString()}",
      token: token,
    );
    return response.fold((l) => l, (r) => r);
  }



  deleteOrder(
      {required String id,required String token, } ) async {
    var response = await api.getData(


      url:"$server/orders/order${id.toString()}",
      token: token,
    );
    return response.fold((l) => l, (r) => r);
  }


// Future<dynamic> updateAddress({
  //   required String token,
  //   required String name,
  //   required String city,
  //   required String region,
  //   required String details,
  //   required String latitude,
  //   required String longitude,
  // }) async {
  //   var response = await api.putData(
  //     token: token,
  //     url: ApiLink.updateAddress,
  //     body: {
  //       "name": name,
  //       "city": city,
  //       "region": region,
  //       "details": details,
  //       "latitude": latitude,
  //       "longitude": longitude,
  //     },
  //   );
  //   return response.fold((l) => l, (r) => r);
  // }

  // Future<dynamic> getAddress({
  //   required String token,
  //
  // }) async {
  //   var response = await api.getData(
  //     token: token,
  //     url: ApiLink.getAddress,
  //
  //   );
  //   return response.fold((l) => l, (r) => r);
  // }


  // Future<dynamic>  deleteAddress({
  //   required String token,
  //
  // }) async {
  //   var response = await api.postData(
  //     token: token,
  //     url: ApiLink.deleteAddress, body: {},
  //
  //   );
  //   return response.fold((l) => l, (r) => r);
  // }






}
