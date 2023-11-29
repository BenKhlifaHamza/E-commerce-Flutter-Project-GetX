import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/routesname.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class SettingsController extends GetxController {
  initData();
  logout();
  doNothing();
  goToPage(String pageName);
}

class SettingsControllerImp extends SettingsController {
  late MyServices myServices;
  late List infoSettings;
  @override
  logout() => {
        Get.defaultDialog(
            title: "Disconnect !",
            middleText: "Do you want to log-out of the app?",
            actions: [
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => AppColor.tertiaryColor)),
                  onPressed: () {
                    String userId =
                        myServices.sharedPreferences.getString("user_id")!;
                    FirebaseMessaging.instance.unsubscribeFromTopic("users");
                    FirebaseMessaging.instance
                        .unsubscribeFromTopic("users$userId");
                    myServices.sharedPreferences.setString('step', "1");
                    Get.offAllNamed(AppRoutes.login);
                    //  Get.offNamedUntil(AppRoutes.login,
                    // (route) => route.settings.name == AppRoutes.login);
                  },
                  child: Text("55".tr)),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => AppColor.grey)),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("56".tr))
            ])
      };

  @override
  doNothing() => print("Nothing");
  @override
  initData() {
    myServices = Get.find();
    infoSettings = [
      {
        "title": "Notification",
        "icon": Icons.notifications_outlined,
        "function": () => {}
      },
      {
        "title": "Address",
        "icon": Icons.location_on_outlined,
        "function": () => {goToPage(AppRoutes.addressesPage)}
      },
      {"title": "About Us", "icon": Icons.info_outline, "function": () {}},
      {
        "title": "Contact Us",
        "icon": Icons.contact_phone_outlined,
        "function": () async {
          // await FlutterPhoneDirectCaller.callNumber("+21628536148");
          launchUrl(Uri.parse("tel:+21628536148"));
        }
      },
      {
        "title": "Lougout",
        "icon": Icons.logout_outlined,
        "function": () => {logout()}
      },
    ];
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  goToPage(String pageName) {
    Get.toNamed(pageName);
  }
}
