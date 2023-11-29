import '../../../../core/class/crud.dart';
import '../../../../linksapi.dart';

class ItemsPageRemote {
  Crud crud;
  ItemsPageRemote(this.crud);

  getData(String categorieId, String userId) async {
    var response = await crud.postData(LinksApi.itemsPageLink,
        {"categorie_id": categorieId.toString(), "user_id": userId});
    return response.fold((l) => l, (r) => r);
  }

  searchItemWithCategorie(String itemName, String categorieId) async {
    var response = await crud.postData(LinksApi.searchItemWithCategorie,
        {"item_name": itemName, "categorie_id": categorieId});
    return response.fold((l) => l, (r) => r);
  }
}
