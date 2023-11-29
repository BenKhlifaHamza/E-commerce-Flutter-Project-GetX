import '../../../../core/class/crud.dart';
import '../../../../linksapi.dart';

class FavoritesView {
  Crud crud;
  FavoritesView(this.crud);

  getFavoritesRemote(String useId) async {
    var response =
        await crud.postData(LinksApi.favoritesView, {'user_id': useId});
    return response.fold((l) => l, (r) => r);
  }
}
