import '../../../../core/class/crud.dart';
import '../../../../linksapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  addFavoriteData(String userId, String itemId) async {
    var response = await crud
        .postData(LinksApi.addFavorite, {"user_id": userId, "item_id": itemId});
    return response.fold((l) => l, (r) => r);
  }

  deleteFavoriteData(String userId, String itemId) async {
    var response = await crud.postData(
        LinksApi.deleteFavorite, {"user_id": userId, "item_id": itemId});
    return response.fold((l) => l, (r) => r);
  }

  removeFavoriteData(String favoriteId) async {
    var response = await crud
        .postData(LinksApi.removeFavorite, {"favorite_id": favoriteId});
    return response.fold((l) => l, (r) => r);
  }
}
