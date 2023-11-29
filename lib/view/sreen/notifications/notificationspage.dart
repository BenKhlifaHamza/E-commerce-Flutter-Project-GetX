import 'package:e_commerce/core/class/handlingdatarequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/notifications/notificationscontroller.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: GetBuilder<NotificationsControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ...List.generate(
                        controller.listNotifications.length,
                        (index) => ListTile(
                            isThreeLine: true,
                            title: Text(controller
                                .listNotifications[index].notificationTitle!),
                            subtitle: Text(controller
                                .listNotifications[index].notificationBody!),
                            trailing: Text(Jiffy(controller
                                    .listNotifications[index].notificationDate)
                                .fromNow())))
                  ],
                ))),
      ),
    );
  }
}
