import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routesname.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/auth/signupremote.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToLogin();
  showPassword();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController password;
  late bool obscureText;

  SignUpRemote signUpRemote = SignUpRemote(Get.find());
  late StatusRequest statusRequest;

  postDataSignUp() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await signUpRemote.postDataSignUpRemote(
        username.text, password.text, email.text, phone.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.toNamed(AppRoutes.verifyCodeSignUp,
            arguments: {"user_email": email.text});
      } else {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(
            title: "Warning", middleText: "Phone Or Email Already Exist.");
      }
    }
    update();
  }

  @override
  signUp() async {
    var formData = loginFormKey.currentState;
    if (formData!.validate()) {
      await postDataSignUp();
    }
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  showPassword() {
    obscureText = !obscureText;
    update();
  }

  @override
  onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    obscureText = true;
    statusRequest = StatusRequest.none;
    super.onInit();
  }

  @override
  dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
