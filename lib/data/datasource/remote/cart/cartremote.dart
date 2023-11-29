import '../../../../core/class/crud.dart';
import '../../../../linksapi.dart';

class CartRemote {
  Crud crud;
  CartRemote(this.crud);

  addCart(String userId, String itemId, String cartCount) async {
    var response = await crud.postData(LinksApi.addCart, {
      "cart_user_id": userId,
      "cart_item_id": itemId,
      "cart_count": cartCount
    });
    return response.fold((l) => l, (r) => r);
  }

  removeCart(String userId, String itemId) async {
    var response = await crud.postData(
        LinksApi.removeCart, {"cart_user_id": userId, "cart_item_id": itemId});
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String userId, String itemId) async {
    var response = await crud.postData(
        LinksApi.deleteCart, {"cart_user_id": userId, "cart_item_id": itemId});
    return response.fold((l) => l, (r) => r);
  }

  getCart(String useId) async {
    var response =
        await crud.postData(LinksApi.cartView, {'cart_user_id': useId});
    return response.fold((l) => l, (r) => r);
  }

  // deleteFavoriteData(String userId, String itemId) async {
  //   var response = await crud.postData(
  //       LinksApi.deleteFavorite, {"user_id": userId, "item_id": itemId});
  //   return response.fold((l) => l, (r) => r);
  // }
}
