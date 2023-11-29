import 'package:e_commerce/core/constant/routesname.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/localization/changelocalization.dart';
import '../widget/language/custombuttonlanguage.dart';

class Language extends GetView<LocalController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr, style: Theme.of(context).textTheme.headline1),
            const SizedBox(
              height: 15,
            ),
            CustomButtonLanguage(
              textButton: 'عربي',
              onPressed: () {
                controller.changeLanguage("ar");
                Get.toNamed(AppRoutes.onBoarding);
              },
            ),
            CustomButtonLanguage(
              textButton: 'English',
              onPressed: () {
                controller.changeLanguage("en");
                Get.toNamed(AppRoutes.onBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
