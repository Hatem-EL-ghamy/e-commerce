import '../helper/http_helper.dart';
import '../helper/link_api.dart';

class HomeData {
  Api api;
  HomeData(this.api);

  Future<dynamic> home({required String token}) async {
    var response = await api.getData(url: ApiLink.home, token: token);
    return response.fold((l) => l, (r) => r);
  }

}