
import '../../../helper/http_helper.dart';
import '../../../helper/link_api.dart';

class ResetCodeData {

  Api api;
  ResetCodeData(this.api);

  // ignore: non_constant_identifier_names
  ResetCode(
      {required String email, required String code,}) async {
    var response = await api.postData(
        url: ApiLink.checkResetCode,
        body: {
          "email" : email ,
          "code" : code ,
        }
    );
    // ignore: non_constant_identifier_names
    return response.fold((Left) => Left, (Right) => Right);
  }


}





