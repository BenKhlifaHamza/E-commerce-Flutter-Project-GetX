import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgetpassword/verifycodecontroller.dart';
import '../../../../core/class/handlingdatarequest.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextsubtitleauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: GetBuilder<VerifyCodeControllerImp>(
            builder: (controllerVerifyCode) => HandlingDataRequest(
                  statusRequest: controllerVerifyCode.statusRequest!,
                  widget: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: ListView(
                      children: [
                        CustomTextTitleAuth(text: "45".tr),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextSubTitleAuth(
                          text: "32".tr,
                        ),
                        CustomTextBodyAuth(
                          text: "33".tr,
                        ),
                        OtpTextField(
                          fieldWidth: 50,
                          borderRadius: BorderRadius.circular(20),
                          numberOfFields: 5,
                          borderColor: AppColor.primaryColor,
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            controllerVerifyCode
                                .goToResetPassword(verificationCode);
                          }, // end onSubmit
                        ),
                      ],
                    ),
                  ),
                )),
      )),
    );
  }
}
