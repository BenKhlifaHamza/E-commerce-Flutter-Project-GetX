import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

customFormCupon(TextEditingController cupon, String title, Function()? confirm,
    Function()? cancel) {
  return Get.defaultDialog(
    title: 'Coupon',
    titleStyle: TextStyle(color: AppColor.white, fontWeight: FontWeight.bold),
    backgroundColor: AppColor.blueGrey,
    radius: 10,
    content: TextField(
      controller: cupon,
      style: TextStyle(
          color: AppColor.white,
          fontFamily: ('none'),
          fontWeight: FontWeight.bold),
      cursorColor: AppColor.white,
      decoration: InputDecoration(
          isDense: true,
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: AppColor.white)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: title,
          labelStyle: TextStyle(color: AppColor.white)),
    ),
    confirm: InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: AppColor.transparent,
      onTap: confirm,
      child: Icon(
        Icons.check_circle,
        color: AppColor.green,
        size: 40,
      ),
    ),
    cancel: InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: AppColor.transparent,
      onTap: cancel,
      child: Icon(
        Icons.cancel,
        color: AppColor.red,
        size: 40,
      ),
    ),
  );
}
