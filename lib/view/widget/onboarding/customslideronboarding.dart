import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboardingcontroller.dart';
import '../../../data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(children: [
              Text(
                onBoardingList[i].title!.tr,
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(height: 70),
              Image.asset(
                onBoardingList[i].image!,
                width: 200,
                height: 200,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 70),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  width: Get.width,
                  alignment: Alignment.center,
                  child: Text(
                    onBoardingList[i].body!.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
            ]));
  }
}
