import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomPaymentMethod extends StatelessWidget {
  final String text;
  final bool isSelected;
  final void Function() onTap;
  const CustomPaymentMethod(
      {Key? key,
      required this.onTap,
      required this.text,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: AppColor.transparent,
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Container(
          alignment: Alignment.centerLeft,
          height: 30,
          width: Get.width,
          margin: const EdgeInsets.only(left: 20),
          padding: const EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
              color: isSelected ? AppColor.tertiaryColor : AppColor.grey,
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18,
                color: AppColor.white,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
