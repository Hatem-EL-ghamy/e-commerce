import '../../helper/http_helper.dart';
import '../../helper/link_api.dart';

class UpdateProfileData {
  Api api;

  UpdateProfileData(this.api);

  updateProfile(
      {required String name,
      required String email,
      required String phone,
      required String token,

      }) async {
    var response =
        await api.putData(token: token, url: ApiLink.updateProfile, body: {
      "name": name,
      "phone": phone,
      "email": email,
    });
    // ignore: non_constant_identifier_names
    return response.fold((l) => l, (r) => r);
  }
}
