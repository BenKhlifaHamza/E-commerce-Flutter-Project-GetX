import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonCheckOut extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  const CustomButtonCheckOut(
      {Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: MaterialButton(
        splashColor: AppColor.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: AppColor.primaryColor,
        textColor: AppColor.white,
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
