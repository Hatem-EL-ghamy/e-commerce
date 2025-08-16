import '../helper/http_helper.dart';
import '../helper/link_api.dart';

class AddressData {
  Api api;

  AddressData(this.api);

  Future<dynamic> addAddress({
    required String token,
    required String name,
    required String city,
    required String region,
    required String details,
    required String latitude,
    required String longitude,
  }) async {
    var response = await api.postData(
      token: token,
      url: ApiLink.addAddress,
      body: {
        "name": name,
        "city": city,
        "region": region,
        "details": details,
        "latitude": latitude,
        "longitude": longitude,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  Future<dynamic> updateAddress({
    required String token,
    required String name,
    required String city,
    required String region,
    required String details,
    required String latitude,
    required String longitude,
  }) async {
    var response = await api.putData(
      token: token,
      url: ApiLink.updateAddress,
      body: {
        "name": name,
        "city": city,
        "region": region,
        "details": details,
        "latitude": latitude,
        "longitude": longitude,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  Future<dynamic> getAddress({
    required String token,

  }) async {
    var response = await api.getData(
      token: token,
      url: ApiLink.getAddress,

    );
    return response.fold((l) => l, (r) => r);
  }


  Future<dynamic>  deleteAddress({
    required String token,

  }) async {
    var response = await api.postData(
      token: token,
      url: ApiLink.deleteAddress, body: {},

    );
    return response.fold((l) => l, (r) => r);
  }






}
