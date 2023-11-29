import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomVisibleButtonTracking extends StatelessWidget {
  final void Function() onTap;
  const CustomVisibleButtonTracking({Key? key, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(width: 1, color: AppColor.white)),
        height: 25,
        width: 80,
        child: Icon(
          Icons.directions,
          color: AppColor.white,
          size: 25,
        ),
      ),
    );
  }
}
