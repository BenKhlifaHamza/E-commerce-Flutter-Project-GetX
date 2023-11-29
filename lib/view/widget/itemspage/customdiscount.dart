import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomDiscount extends StatelessWidget {
  final String discount;
  const CustomDiscount({Key? key, required this.discount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (discount == '0') {
      return const SizedBox();
    }
    return Stack(
      children: [
        ...List.generate(
            4,
            (index) => Positioned(
                left: 4,
                top: 4,
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation((index * 22.5) / 360),
                  child: Stack(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        color: AppColor.red,
                      ),
                    ],
                  ),
                ))),
        Positioned(
            left: 4,
            top: 8,
            child: Text(
              '-$discount%',
              style:
                  TextStyle(color: AppColor.white, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
