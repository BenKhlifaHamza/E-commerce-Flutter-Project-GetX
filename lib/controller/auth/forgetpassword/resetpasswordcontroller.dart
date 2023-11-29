import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/constant/routesname.dart';
import '../../../core/functions/handlingdata.dart';
import '../../../data/datasource/remote/auth/forgetpassword/resetpaswordremote.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  showPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController rePassword;
  late bool obscureText;
  String? email;
  StatusRequest? statusRequest;
  ResetPasswordRemote resetPasswordRemote = ResetPasswordRemote(Get.find());

  sendNewPassword() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await resetPasswordRemote.sendResetPasswordRemote(
        email!, password.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.toNamed(AppRoutes.successResetPasword);
      } else {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(
            title: "Warning", middleText: "Fail Reset Password.\nTry Again");
      }
    }
    update();
  }

  @override
  resetPassword() async {
    var formData = loginFormKey.currentState;
    if (formData!.validate()) {
      if (password.text != rePassword.text) {
        Get.defaultDialog(
            title: "Warning", middleText: "Both Passwords Must Match");
      } else {
        await sendNewPassword();
      }
    }
  }

  @override
  showPassword() {
    obscureText = !obscureText;
    update();
  }

  @override
  onInit() {
    super.onInit();
    password = TextEditingController();
    rePassword = TextEditingController();
    obscureText = true;
    email = Get.arguments['user_email'];
    statusRequest = StatusRequest.none;
  }

  @override
  dispose() {
    super.dispose();
    password.dispose();
    rePassword.dispose();
  }
}
