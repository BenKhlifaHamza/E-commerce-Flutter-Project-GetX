import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/remote/notifications/notificationsremote.dart';
import 'package:get/get.dart';

import '../../data/datamodel/notificationmodel.dart';

abstract class NotificationsController extends GetxController {
  getNotifications();
  init();
}

class NotificationsControllerImp extends NotificationsController {
  late NotificationsRemote notificationsRemote;
  late MyServices myServices;
  late List<NotificationModel> listNotifications;
  late StatusRequest statusRequest;

  late String userId;
  @override
  init() {
    myServices = Get.find();
    notificationsRemote = NotificationsRemote(Get.find());
    userId = myServices.sharedPreferences.getString("user_id")!;
    listNotifications = [];
    getNotifications();
  }

  @override
  getNotifications() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationsRemote.getNotificationsRemotea(userId);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        listNotifications.clear();
        List tempList = response['data'];
        listNotifications
            .addAll(tempList.map((e) => NotificationModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
