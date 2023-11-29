import '../../../../core/class/crud.dart';
import '../../../../linksapi.dart';

class CuponRemote {
  Crud crud;
  CuponRemote(this.crud);

  getCuponRemote(String cuponCode) async {
    var response =
        await crud.postData(LinksApi.getCupon, {'cupon_code': cuponCode});
    return response.fold((l) => l, (r) => r);
  }
}
