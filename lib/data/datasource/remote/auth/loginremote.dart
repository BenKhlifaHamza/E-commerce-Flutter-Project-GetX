import '../../../../core/class/crud.dart';
import '../../../../linksapi.dart';

class LoginRemote {
  Crud crud;
  LoginRemote(this.crud);

  postDataLoginRemote(
    String userEmail,
    String password,
  ) async {
    var response = await crud.postData(LinksApi.loginLink, {
      "user_email": userEmail,
      "user_password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
