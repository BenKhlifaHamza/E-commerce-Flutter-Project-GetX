import 'package:e_commerce/controller/onboardingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CustomDotsOnBoarding extends StatelessWidget {
  const CustomDotsOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) =>
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ...List.generate(
                  onBoardingList.length,
                  (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        width: controller.currentPage == index ? 20 : 6,
                        height: 6,
                        margin: const EdgeInsets.only(right: 2),
                        decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                      ))
            ]));
  }
}
