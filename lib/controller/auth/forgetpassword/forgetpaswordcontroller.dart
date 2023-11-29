import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/constant/routesname.dart';
import '../../../core/functions/handlingdata.dart';
import '../../../data/datasource/remote/auth/forgetpassword/forgetpasswordremote.dart';

abstract class ForgetPasswordController extends GetxController {
  goToVerifyPassword();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController email;

  ForgetPasswordRemote forgetPasswordRemote = ForgetPasswordRemote(Get.find());
  StatusRequest? statusRequest;

  checkEmail() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await forgetPasswordRemote.forgetPasswordRemote(email.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.toNamed(AppRoutes.verifyCode,
            arguments: {"user_email": email.text});
      } else {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(title: "Warning", middleText: "Email Not Existe.");
      }
    }
    update();
  }

  @override
  goToVerifyPassword() async {
    var formData = loginFormKey.currentState;
    if (formData!.validate()) {
      await checkEmail();
    }
  }

  @override
  onInit() {
    email = TextEditingController();
    statusRequest = StatusRequest.none;
    super.onInit();
  }

  @override
  dispose() {
    email.dispose();
    super.dispose();
  }
}
