import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomDescriptionText extends StatelessWidget {
  final String description;
  const CustomDescriptionText({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, top: 6),
      child: Text(
        description,
        style: TextStyle(
            color: AppColor.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
