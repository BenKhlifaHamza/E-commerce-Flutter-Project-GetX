import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomTitleCheckOut extends StatelessWidget {
  final String text;
  const CustomTitleCheckOut({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 20,
          color: AppColor.secondColor,
          fontWeight: FontWeight.bold),
    );
  }
}
