
import '../../../helper/http_helper.dart';
import '../../../helper/link_api.dart';

class ForgetData {

  Api api;
  ForgetData(this.api);

  // ignore: non_constant_identifier_names
  ForgetPassword(
      {required String email}) async {
    var response = await api.postData(
        url: ApiLink.forgetPassword,
        body: {
          "email" : email ,
        }
    );
    // ignore: non_constant_identifier_names
    return response.fold((Left) => Left, (Right) => Right);
  }


}





