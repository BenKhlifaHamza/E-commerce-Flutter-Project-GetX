import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomContainerColor extends StatelessWidget {
  final String active;
  final String title;
  final Color color;
  const CustomContainerColor(
      {Key? key,
      required this.title,
      required this.color,
      required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: active == "1" ? color : AppColor.white,
          border: Border.all(
            color: AppColor.itemsColor,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: active == "1" ? AppColor.white : color,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
