import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomVisibleDeleteButton extends StatelessWidget {
  final void Function()? onConfirm;
  const CustomVisibleDeleteButton({Key? key, this.onConfirm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.defaultDialog(
            backgroundColor: AppColor.blueGrey,
            radius: 10,
            title: "Warning!",
            middleText: "Do You Want Delete This Order ?",
            textConfirm: "Yes",
            confirmTextColor: AppColor.white,
            textCancel: "No",
            cancelTextColor: AppColor.white,
            onConfirm: onConfirm);
      },
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(width: 1, color: AppColor.white)),
        height: 25,
        width: 80,
        child: Icon(
          Icons.delete_forever_outlined,
          color: AppColor.white,
          size: 25,
        ),
      ),
    );
  }
}
