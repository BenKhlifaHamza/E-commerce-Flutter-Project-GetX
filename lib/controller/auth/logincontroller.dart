import 'package:e_commerce/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routesname.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/auth/loginremote.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
  showPassword();
  initData();
}

class LoginControllerImp extends LoginController {
  late GlobalKey<FormState> loginFormKey;
  late TextEditingController password;
  late StatusRequest statusRequest;
  late TextEditingController email;
  late LoginRemote loginRemote;
  late MyServices myServices;
  late bool obscureText;

  postDataSignUp() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await loginRemote.postDataLoginRemote(email.text, password.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        if (response['data']["user_approuve"] == "1") {
          myServices.sharedPreferences
              .setString('user_id', response['data']["user_id"]);
          myServices.sharedPreferences
              .setString('user_email', response['data']["user_email"]);
          myServices.sharedPreferences
              .setString('user_phone', response['data']["user_phone"]);
          myServices.sharedPreferences
              .setString('user_phone', response['data']["user_name"]);
          myServices.sharedPreferences.setString('step', "2");
          FirebaseMessaging.instance.subscribeToTopic("users");
          FirebaseMessaging.instance
              .subscribeToTopic("users${response['data']["user_id"]}");
          Get.offNamed(AppRoutes.homeScreen);
        } else {
          Get.offNamed(AppRoutes.verifyCodeSignUp,
              arguments: {"user_email": response['data']["user_email"]});
        }
      } else {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(
            title: "Warning", middleText: "Email Or Password Not Vlide .");
        update();
      }
    } else {
      update();
    }
  }

  @override
  login() async {
    var formData = loginFormKey.currentState;
    if (formData!.validate()) {
      await postDataSignUp();
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signUp);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  showPassword() {
    obscureText = !obscureText;
    update();
  }

  @override
  initData() {
    //FirebaseMessaging.instance.getToken().then((value) => print(value));
    loginFormKey = GlobalKey<FormState>();
    loginRemote = LoginRemote(Get.find());
    statusRequest = StatusRequest.none;
    password = TextEditingController();
    email = TextEditingController();
    myServices = Get.find();
    obscureText = true;
  }

  @override
  onInit() {
    initData();
    super.onInit();
  }

  @override
  dispose() {
    password.dispose();
    email.dispose();
    super.dispose();
  }
}
