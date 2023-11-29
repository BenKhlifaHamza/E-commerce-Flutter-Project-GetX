import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomTextSignUpAuth extends StatelessWidget {
  final String text;
  final String textButton;
  final void Function() onTap;
  const CustomTextSignUpAuth(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.textButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        InkWell(
          onTap: onTap,
          child: Text(
            textButton,
            style: TextStyle(
                color: AppColor.primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
