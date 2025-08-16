


import '../../../helper/http_helper.dart';
import '../../../helper/link_api.dart';

class VerificationCodeRegisterData {

  Api api;
  VerificationCodeRegisterData(this.api);
  verificationCodeRegister(
      {required String email,required String code }) async {
    var response = await api.postData(

        url: ApiLink.verifyCode,
        body:{
          "email" : email,
          "code" : code,

        }
    );
    return response.fold((l) => l, (r) => r);
  }


}
