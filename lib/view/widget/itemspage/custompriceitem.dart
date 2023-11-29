import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomPriceItem extends StatelessWidget {
  final String price;
  final bool discounted;
  const CustomPriceItem(
      {Key? key, required this.price, required this.discounted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: AppColor.gold,
            border: Border.all(),
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          price,
          style: TextStyle(
              decoration: !discounted ? TextDecoration.lineThrough : null,
              decorationThickness: 2,
              fontWeight: FontWeight.bold,
              fontFamily: "sans",
              fontSize: 20,
              color: AppColor.grey2),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
