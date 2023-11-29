import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/tologincontroller.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/custombuttonauth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToLoginControllerImp toLoginController = Get.put(ToLoginControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "39".tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.primaryColor),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 200,
                    color: AppColor.primaryColor,
                  ),
                  Text("40".tr),
                  const Spacer(),
                  SizedBox(
                    width: Get.width,
                    child: CustomButtonAuth(
                      textButton: "11".tr,
                      onPressed: () {
                        toLoginController.goToLogin();
                      },
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
