import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboardingcontroller.dart';
import '../widget/onboarding/custombuttononboarding.dart';
import '../widget/onboarding/customdotsonboarding.dart';
import '../widget/onboarding/customslideronboarding.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        const Expanded(flex: 3, child: CustomSliderOnBoarding()),
        Expanded(
            flex: 1,
            child: Column(
              children: const [
                CustomDotsOnBoarding(),
                Spacer(
                  flex: 1,
                ),
                CustomButtonOnBoarding()
              ],
            ))
      ],
    )));
  }
}
