import 'package:e_commerce/core/constant/routesname.dart';
import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/functions/handlingdata.dart';
import '../../../data/datasource/remote/auth/forgetpassword/verifycoderemote.dart';

abstract class VerifyCodeController extends GetxController {
  goToResetPassword(String verifyCode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;
  VerifyCodeRemote verifyCodeRemote = VerifyCodeRemote(Get.find());
  StatusRequest? statusRequest;

  sendVerifyCode(String verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeRemote.sendVerifyCodeRemote(email!, verifyCode);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoutes.resetPassword,
            arguments: {"user_email": email!});
      } else {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(
            title: "Warning", middleText: "Verify Code Not Valide.");
      }
    }
    update();
  }

  @override
  goToResetPassword(String verifyCode) async {
    await sendVerifyCode(verifyCode);
  }

  @override
  onInit() {
    email = Get.arguments['user_email'];
    statusRequest = StatusRequest.none;
    super.onInit();
  }

  @override
  dispose() {
    super.dispose();
  }
}
