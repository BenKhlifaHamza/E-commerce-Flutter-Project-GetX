import 'package:get/get.dart';

import '../core/class/crud.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    //Get.put(Crud());
    Get.lazyPut(() => Crud(), fenix: true);
  }
}
