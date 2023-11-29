import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String text;

  const CustomTextTitleAuth({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      style:
          Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.grey),
      textAlign: TextAlign.center,
    );
  }
}
