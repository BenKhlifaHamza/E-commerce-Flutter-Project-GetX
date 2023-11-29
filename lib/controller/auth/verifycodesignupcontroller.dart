import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routesname.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/auth/resendverifycode.dart';
import '../../data/datasource/remote/auth/verifycodesignupremote.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  goToSuccessSignUp(String verificationCode);
  resendCode();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  String? email = Get.arguments['user_email'];
  late ResendVerifyCode resendVerifyCode;

  VerifyCodeSignUpRemote verifyCodeSignUpRemote =
      VerifyCodeSignUpRemote(Get.find());
  StatusRequest? statusRequest;

  sendVerifyCode(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUpRemote.sendVerifyCodeSigUpRemote(
        email!, verificationCode);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoutes.successSignUp);
      } else {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(
            title: "Warning", middleText: "Verify Code Not Valide.");
      }
    }
    update();
  }

  @override
  resendCode() async {
    await resendVerifyCode.resendVerifyCode(email!);
  }

  @override
  goToSuccessSignUp(String verificationCode) async {
    await sendVerifyCode(verificationCode);
  }

  @override
  onInit() {
    statusRequest = StatusRequest.none;
    resendVerifyCode = ResendVerifyCode(Get.find());
    super.onInit();
  }

  @override
  dispose() {
    super.dispose();
  }
}
