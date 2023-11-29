import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomQuantityWidget extends StatelessWidget {
  final String quantity;
  const CustomQuantityWidget({Key? key, required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.tertiaryColor),
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        quantity,
        style: const TextStyle(
            fontFamily: "sans", fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
