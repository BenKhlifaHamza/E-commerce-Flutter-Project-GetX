import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomTextTitlesRow extends StatelessWidget {
  final String title;
  const CustomTextTitlesRow({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 16,
          color: AppColor.itemsColor,
          fontWeight: FontWeight.bold),
    );
  }
}
