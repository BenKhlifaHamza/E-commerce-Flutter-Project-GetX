import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomContainerDecoration extends StatelessWidget {
  const CustomContainerDecoration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      decoration: BoxDecoration(
          color: AppColor.itemsColor,
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(20))),
    );
  }
}
