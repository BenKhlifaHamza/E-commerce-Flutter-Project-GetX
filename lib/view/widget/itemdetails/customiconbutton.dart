import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomIconButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  const CustomIconButton(
      {Key? key, required this.onPressed, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: AppColor.transparent,
      highlightColor: AppColor.transparent,
      onPressed: onPressed,
      icon: Icon(icon),
      color: AppColor.tertiaryColor,
    );
  }
}
