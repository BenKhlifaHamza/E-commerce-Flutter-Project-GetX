import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signupcontroller.dart';
import '../../../core/class/handlingdatarequest.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformfiledauth.dart';
import '../../widget/auth/customtextsignupauth.dart';
import '../../widget/auth/customtextsubtitleauth.dart';
import '../../widget/auth/customtexttitleauth.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
        body: WillPopScope(
      onWillPop: alertExitApp,
      child: SafeArea(
        child: Center(
          child: GetBuilder<SignUpControllerImp>(
              builder: (controllerSignUp) => HandlingDataRequest(
                    statusRequest: controllerSignUp.statusRequest,
                    widget: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      child: Form(
                        key: controllerSignUp.loginFormKey,
                        child: ListView(
                          children: [
                            CustomTextTitleAuth(text: "20".tr),
                            CustomTextSubTitleAuth(
                              text: "21".tr,
                            ),
                            CustomTextBodyAuth(
                              text: "22".tr,
                            ),
                            CustomTextFormFiledAuth(
                              validator: (val) {
                                return validInput(val!, 5, 100, "username");
                              },
                              controller: controllerSignUp.username,
                              hintText: '23'.tr,
                              icon: Icons.person_2_outlined,
                              keyboardType: TextInputType.text,
                              labelText: '24'.tr,
                            ),
                            CustomTextFormFiledAuth(
                              validator: (val) {
                                return validInput(val!, 5, 100, "email");
                              },
                              controller: controllerSignUp.email,
                              hintText: '14'.tr,
                              icon: Icons.email_outlined,
                              keyboardType: TextInputType.emailAddress,
                              labelText: '15'.tr,
                            ),
                            CustomTextFormFiledAuth(
                              validator: (val) {
                                return validInput(val!, 5, 100, "phone");
                              },
                              controller: controllerSignUp.phone,
                              hintText: '25'.tr,
                              icon: Icons.phone_outlined,
                              keyboardType: TextInputType.number,
                              labelText: '26'.tr,
                            ),
                            GetBuilder<SignUpControllerImp>(
                                builder: (controller) =>
                                    CustomTextFormFiledAuth(
                                      validator: (val) {
                                        return validInput(
                                            val!, 8, 30, "password");
                                      },
                                      onTapIcon: () {
                                        controller.showPassword();
                                      },
                                      controller: controller.password,
                                      hintText: '16'.tr,
                                      icon: controller.obscureText
                                          ? Icons.lock_outline
                                          : Icons.lock_open_outlined,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      labelText: '17'.tr,
                                      obscureText: controller.obscureText,
                                    )),
                            CustomButtonAuth(
                              textButton: "20".tr,
                              onPressed: () {
                                controllerSignUp.signUp();
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextSignUpAuth(
                              text: "27".tr,
                              onTap: () {
                                controllerSignUp.goToLogin();
                              },
                              textButton: '11'.tr,
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
        ),
      ),
    ));
  }
}
