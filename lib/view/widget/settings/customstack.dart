import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomStack extends StatelessWidget {
  final String imgName;
  const CustomStack({Key? key, required this.imgName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          color: AppColor.secondColor,
        ),
        Positioned(
          left: 20,
          top: 170,
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: AppColor.white, borderRadius: BorderRadius.circular(50)),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.secondColor, width: 2),
                  borderRadius: BorderRadius.circular(50)),
              child: CircleAvatar(
                backgroundColor: AppColor.white,
                backgroundImage: AssetImage(imgName),
                radius: 30,
              ),
            ),
          ),
        )
      ],
    );
  }
}
