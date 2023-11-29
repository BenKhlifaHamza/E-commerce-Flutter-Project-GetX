import '../../../core/class/crud.dart';
import '../../../linksapi.dart';

class TestData {
  Crud crud;
  TestData(this.crud);

  getData() async {
    var response = await crud.postData(LinksApi.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
