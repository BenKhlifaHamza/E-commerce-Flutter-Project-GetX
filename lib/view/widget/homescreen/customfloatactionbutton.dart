import 'package:e_commerce/controller/home/homescreencontroller.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomFloatActionButton extends StatelessWidget {
  final HomeScreenControllerImp controllerHomeScreen;
  const CustomFloatActionButton({Key? key, required this.controllerHomeScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: AppColor.categoriesColor,
        foregroundColor: AppColor.white,
        splashColor: AppColor.transparent,
        onPressed: () {
          controllerHomeScreen.goToPage(4);
        },
        child: const Icon(Icons.shopping_bag_outlined));
  }
}
