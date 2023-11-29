import 'package:e_commerce/controller/orders/orderscontroller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

import '../../controller/home/homescreencontroller.dart';

fireBaseCloudMessagingConfig() {
  FirebaseMessaging.onMessage.listen((remoteMessage) {
    print("################-Notification-################");
    // print(remoteMessage.notification!.title);
    // print(remoteMessage.notification!.body);
    FlutterRingtonePlayer().playNotification();
    Get.snackbar("${remoteMessage.notification!.title}",
        "${remoteMessage.notification!.body}");
    refrechOrderPage(remoteMessage.data);
  });
}

refrechOrderPage(data) {
  HomeScreenControllerImp controllerHomeScreen = Get.find();
  if (controllerHomeScreen.currentPage == 4) {
    OrdersControllerImp controllerOrder = Get.find();
    controllerOrder.refrechOrderPage();
  }
}
