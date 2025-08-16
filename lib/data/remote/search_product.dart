import '../helper/http_helper.dart';
import '../helper/link_api.dart';

class SearchProduct {
  Api api;
  SearchProduct(this.api);

   searchProductData({required String keywords,required String token}) async {
    var response = await api.postData(
        url: ApiLink.searchProduct,
        token: token,
        body: {
          "keywords":keywords,
        }
    );
    return response.fold((l) => l, (r) => r);
  }
}