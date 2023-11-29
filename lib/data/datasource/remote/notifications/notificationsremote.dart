import '../../../../core/class/crud.dart';
import '../../../../linksapi.dart';

class NotificationsRemote {
  Crud crud;
  NotificationsRemote(this.crud);

  getNotificationsRemotea(String userId) async {
    var response =
        await crud.postData(LinksApi.getNotifications, {"user_id": userId});
    return response.fold((l) => l, (r) => r);
  }
}
