
import '../../../helper/http_helper.dart';
import '../../../helper/link_api.dart';

class ResetPasswordData {

  Api api;
  ResetPasswordData(this.api);

  // ignore: non_constant_identifier_names
  ResetPassword(
      {required String email,required String code, required String password,}) async {
    var response = await api.postData(
        url: ApiLink.resetPassword,
        body: {
          "email" : email ,
          "password" : password  ,
          "code"  :code,

        }
    );
    // ignore: non_constant_identifier_names
    return response.fold((Left) => Left, (Right) => Right);
  }


}





