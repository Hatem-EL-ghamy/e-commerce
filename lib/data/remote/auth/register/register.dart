


import '../../../helper/http_helper.dart';
import '../../../helper/link_api.dart';

class RegisterData {

  Api api;
  RegisterData(this.api);
  userRegister(
      {required String name, required String phone,required String email,required String password,  }) async {
    var response = await api.postData(
        url: ApiLink.register,
       body:{
        "name" : name,
         "phone" : phone,
         "email" : email,
        "password" : password,

        }
        );
    // ignore: non_constant_identifier_names
    return response.fold((l) => l, (r) => r);
  }


}
