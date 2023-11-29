import '../../../../../core/class/crud.dart';
import '../../../../../linksapi.dart';

class ForgetPasswordRemote {
  Crud crud;
  ForgetPasswordRemote(this.crud);

  forgetPasswordRemote(
    String userEmail,
  ) async {
    var response = await crud.postData(LinksApi.forgetPasswordLink, {
      "user_email": userEmail,
    });
    return response.fold((l) => l, (r) => r);
  }
}
