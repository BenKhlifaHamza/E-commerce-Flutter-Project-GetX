import 'package:e_commerce/core/constant/routesname.dart';
import 'package:get/get.dart';

abstract class ToLoginController extends GetxController {
  goToLogin();
}

class ToLoginControllerImp extends ToLoginController {
  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}
