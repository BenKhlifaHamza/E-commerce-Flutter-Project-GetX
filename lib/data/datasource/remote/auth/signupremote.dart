import '../../../../core/class/crud.dart';
import '../../../../linksapi.dart';

class SignUpRemote {
  Crud crud;
  SignUpRemote(this.crud);

  postDataSignUpRemote(String userName, String password, String userEmail,
      String userPhone) async {
    var response = await crud.postData(LinksApi.signUpLink, {
      "user_name": userName,
      "user_password": password,
      "user_email": userEmail,
      "user_phone": userPhone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
