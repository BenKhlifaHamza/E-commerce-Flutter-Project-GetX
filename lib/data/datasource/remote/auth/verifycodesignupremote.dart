import '../../../../core/class/crud.dart';
import '../../../../linksapi.dart';

class VerifyCodeSignUpRemote {
  Crud crud;
  VerifyCodeSignUpRemote(this.crud);

  sendVerifyCodeSigUpRemote(String userEmail, String verifyCode) async {
    var response = await crud.postData(LinksApi.verifyCodeSignUpLink, {
      "user_email": userEmail,
      "user_verifyCode": verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
