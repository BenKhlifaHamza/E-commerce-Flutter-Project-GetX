import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonNavBar extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final IconData icon;
  final bool active;
  const CustomButtonNavBar(
      {Key? key,
      required this.onPressed,
      required this.title,
      required this.icon,
      required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: AppColor.transparent,
      highlightColor: AppColor.transparent,
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active == true ? AppColor.white : AppColor.categoriesColor,
          ),
          Text(
            title,
            style: TextStyle(
                color:
                    active == true ? AppColor.white : AppColor.categoriesColor),
          ),
        ],
      ),
    );
  }
}
