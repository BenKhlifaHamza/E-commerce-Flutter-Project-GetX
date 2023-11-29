import '../../../core/class/crud.dart';
import '../../../linksapi.dart';

class HomePageRemote {
  Crud crud;
  HomePageRemote(this.crud);

  getData() async {
    var response = await crud.postData(LinksApi.homePageLink, {});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String itemName) async {
    var response =
        await crud.postData(LinksApi.searchItem, {"item_name": itemName});
    return response.fold((l) => l, (r) => r);
  }
}
