import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../functions/firebasecloudmassaging.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  late bool serviceEnabled;
  late LocationPermission permission;
  late FirebaseMessaging messaging;
  Future<MyServices> init() async {
    await Firebase.initializeApp();
    sharedPreferences = await SharedPreferences.getInstance();
    messaging = FirebaseMessaging.instance;
    await requestLocationPermession();
    await requestNotificationPermession();
    fireBaseCloudMessagingConfig();
    return this;
  }

  requestNotificationPermession() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // return Get.snackbar(
      //     'Notification Permession', 'User granted permission.');
      print("###############-User granted Notification permission.");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      // return Get.snackbar(
      //     'Notification Permession', 'User granted provisional permission.');
      print(
          "###############-User granted provisional Notification permission.");
    } else {
      // return Get.snackbar('Notification Permession',
      //     'User declined or has not accepted permission.');
      print(
          "###############-User declined or has not accepted Notification permission.");
    }
  }

  requestLocationPermession() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // return Get.snackbar(
      //     'Location Permession', 'Location services are disabled.');
      print("###############-Location services are disabled.");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // return Get.snackbar(
        //     'Location Permession', 'Location permissions are denied');
        print("###############-Location permissions are denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // return Get.snackbar('Location Permession',
      //     'Location permissions are permanently denied, we cannot request permissions.');
      print(
          "###############-Location permissions are permanently denied, we cannot request permissions.");
    }
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
