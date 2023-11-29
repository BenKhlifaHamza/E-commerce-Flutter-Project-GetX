import '../../../../../core/class/crud.dart';
import '../../../../../linksapi.dart';

class ResetPasswordRemote {
  Crud crud;
  ResetPasswordRemote(this.crud);

  sendResetPasswordRemote(String userEmail, String password) async {
    var response = await crud.postData(LinksApi.resetPasswordLink, {
      "user_email": userEmail,
      "user_password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
