import '../../../../../core/class/crud.dart';
import '../../../../../linksapi.dart';

class VerifyCodeRemote {
  Crud crud;
  VerifyCodeRemote(this.crud);

  sendVerifyCodeRemote(String userEmail, String verifyCode) async {
    var response = await crud.postData(LinksApi.verifyCodeForgetPasswordLink, {
      "user_email": userEmail,
      "user_verifyCode": verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
