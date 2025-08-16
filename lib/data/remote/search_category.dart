import '../helper/http_helper.dart';
import '../helper/link_api.dart';

class SearchCategory {
  Api api;
  SearchCategory(this.api);

  searchCategoryData({required String keywords,}) async {
    var response = await api.postData(
        url: ApiLink.searchCategory,
        body: {
          "keywords":keywords,
        }
    );
    return response.fold((l) => l, (r) => r);
  }
}