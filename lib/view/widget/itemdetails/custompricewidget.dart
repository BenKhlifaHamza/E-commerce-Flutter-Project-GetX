import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomPriceWidget extends StatelessWidget {
  final String price;
  const CustomPriceWidget({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          border: Border.all(),
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        "$price\$",
        style: TextStyle(
            color: AppColor.gold,
            fontFamily: "sans",
            fontSize: 22,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
