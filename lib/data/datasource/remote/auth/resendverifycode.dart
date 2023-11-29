import '../../../../core/class/crud.dart';
import '../../../../linksapi.dart';

class ResendVerifyCode {
  Crud crud;
  ResendVerifyCode(this.crud);

  resendVerifyCode(String userEmail) async {
    var response = await crud
        .postData(LinksApi.resendVerifyCode, {"user_email": userEmail});
    return response.fold((l) => l, (r) => r);
  }
}
