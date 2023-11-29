import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgetpassword/resetpasswordcontroller.dart';
import '../../../../core/class/handlingdatarequest.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformfiledauth.dart';
import '../../../widget/auth/customtextsubtitleauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: GetBuilder<ResetPasswordControllerImp>(
            builder: ((controllerResetPassword) => HandlingDataRequest(
                  statusRequest: controllerResetPassword.statusRequest!,
                  widget: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Form(
                      key: controllerResetPassword.loginFormKey,
                      child: ListView(
                        children: [
                          CustomTextTitleAuth(text: "34".tr),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextSubTitleAuth(
                            text: "35".tr,
                          ),
                          CustomTextBodyAuth(
                            text: "36".tr,
                          ),
                          GetBuilder<ResetPasswordControllerImp>(
                              builder: (controller) => Column(
                                    children: [
                                      CustomTextFormFiledAuth(
                                        validator: (val) {
                                          return validInput(
                                              val!, 8, 30, "password");
                                        },
                                        onTapIcon: () {
                                          controller.showPassword();
                                        },
                                        controller: controller.password,
                                        hintText: '37'.tr,
                                        icon: controller.obscureText
                                            ? Icons.lock_outline
                                            : Icons.lock_open_outlined,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        labelText: '17'.tr,
                                        obscureText: controller.obscureText,
                                      ),
                                      CustomTextFormFiledAuth(
                                        validator: (val) {
                                          return validInput(
                                              val!, 8, 30, "password");
                                        },
                                        onTapIcon: () {
                                          controller.showPassword();
                                        },
                                        controller: controller.rePassword,
                                        hintText: "38".tr,
                                        icon: controller.obscureText
                                            ? Icons.lock_outline
                                            : Icons.lock_open_outlined,
                                        keyboardType: TextInputType.text,
                                        labelText: "17".tr,
                                        obscureText: controller.obscureText,
                                      ),
                                    ],
                                  )),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomButtonAuth(
                            textButton: "30".tr,
                            onPressed: () {
                              controllerResetPassword.resetPassword();
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ))),
      ),
    ));
  }
}
