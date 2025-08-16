import '../helper/http_helper.dart';
import '../helper/link_api.dart';

class FavoriteData {
  Api api;
  FavoriteData(this.api);

  Future<dynamic> favoriteData(

      {required String productId ,required String token } ) async {
    var response = await api.postData(
      url: ApiLink.favorite,
      token: token,
      body: {
        "product_id":productId.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }


}