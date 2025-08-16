

















import '../helper/http_helper.dart';
import '../helper/link_api.dart';

class MyFavoriteData {
  static const String server="https://store-project.shop/api/v1";
  Api api;
  MyFavoriteData(this.api);

  Future<dynamic> getFavoriteData(

      {required String token } ) async {
    var response = await api.getData(
      url: ApiLink.myFavorite,
      token: token,
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteFavoriteData(

      {required String id,required String token, } ) async {
    var response = await api.postData(
      body: {},
      url:"$server/favorites/delete-favarite/${id.toString()}",
      token: token,
    );
    return response.fold((l) => l, (r) => r);
  }

}