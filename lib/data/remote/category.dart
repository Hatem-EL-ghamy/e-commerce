import '../helper/http_helper.dart';
import '../helper/link_api.dart';

class CategoryData {
  Api api;
  CategoryData(this.api);

  Future<dynamic> category() async {
    var response = await api.getData(url: ApiLink.category,);
    return response.fold((l) => l, (r) => r);
  }
}