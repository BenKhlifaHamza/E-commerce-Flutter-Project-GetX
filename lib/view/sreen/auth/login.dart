import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/logincontroller.dart';
import '../../../core/class/handlingdatarequest.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customlogoaut.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextbuttonforgetpassauth.dart';
import '../../widget/auth/customtextformfiledauth.dart';
import '../../widget/auth/customtextsignupauth.dart';
import '../../widget/auth/customtextsubtitleauth.dart';
import '../../widget/auth/customtexttitleauth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        body: WillPopScope(
      onWillPop: alertExitApp,
      child: SafeArea(
        child: Center(
          child: GetBuilder<LoginControllerImp>(
              builder: ((controllerLogin) => HandlingDataRequest(
                    statusRequest: controllerLogin.statusRequest,
                    widget: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      child: Center(
                        child: Form(
                          key: controllerLogin.loginFormKey,
                          child: ListView(
                            children: [
                              CustomTextTitleAuth(text: "11".tr),
                              const CustomLogoAuth(),
                              CustomTextSubTitleAuth(
                                text: "12".tr,
                              ),
                              CustomTextBodyAuth(
                                text: "13".tr,
                              ),
                              CustomTextFormFiledAuth(
                                validator: (val) {
                                  return validInput(val!, 5, 100, "email");
                                },
                                controller: controllerLogin.email,
                                hintText: '14'.tr,
                                icon: Icons.email_outlined,
                                keyboardType: TextInputType.emailAddress,
                                labelText: '15'.tr,
                              ),
                              GetBuilder<LoginControllerImp>(
                                  builder: (controller) =>
                                      CustomTextFormFiledAuth(
                                        validator: (val) {
                                          return validInput(
                                              val!, 8, 30, "password");
                                        },
                                        onTapIcon: () {
                                          controllerLogin.showPassword();
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
                              CustomTextForgetPassWordAuth(
                                text: "18".tr,
                                onPressed: () {
                                  controllerLogin.goToForgetPassword();
                                },
                              ),
                              CustomButtonAuth(
                                textButton: "11".tr,
                                onPressed: () {
                                  controllerLogin.login();
                                },
                              ),
                              const SizedBox(height: 20),
                              CustomTextSignUpAuth(
                                text: "19".tr,
                                textButton: "20".tr,
                                onTap: () {
                                  controllerLogin.goToSignUp();
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))),
        ),
      ),
    ));
  }
}
