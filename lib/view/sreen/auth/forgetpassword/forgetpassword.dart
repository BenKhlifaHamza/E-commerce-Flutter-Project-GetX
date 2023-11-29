import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgetpassword/forgetpaswordcontroller.dart';
import '../../../../core/class/handlingdatarequest.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformfiledauth.dart';
import '../../../widget/auth/customtextsubtitleauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: GetBuilder<ForgetPasswordControllerImp>(
            builder: ((controllerForgetPassword) => HandlingDataRequest(
                  statusRequest: controllerForgetPassword.statusRequest!,
                  widget: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Center(
                      child: ListView(
                        children: [
                          CustomTextTitleAuth(text: "18".tr),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextSubTitleAuth(
                            text: "28".tr,
                          ),
                          CustomTextBodyAuth(
                            text: "29".tr,
                          ),
                          Form(
                            key: controllerForgetPassword.loginFormKey,
                            child: CustomTextFormFiledAuth(
                              validator: (val) {
                                return validInput(val!, 5, 100, "email");
                              },
                              controller: controllerForgetPassword.email,
                              hintText: '14'.tr,
                              icon: Icons.email_outlined,
                              keyboardType: TextInputType.emailAddress,
                              labelText: '15'.tr,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomButtonAuth(
                            textButton: "30".tr,
                            onPressed: () {
                              controllerForgetPassword.goToVerifyPassword();
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
