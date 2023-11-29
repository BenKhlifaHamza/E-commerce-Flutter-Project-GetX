import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomDataPrice extends StatelessWidget {
  final String title;
  final String data;
  const CustomDataPrice({Key? key, required this.title, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              "$title :",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: AppColor.blueGrey,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            )),
        Expanded(
            flex: 3,
            child: Text(
              "$data\$",
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: "none",
                  color: AppColor.gold),
            ))
      ],
    );
  }
}
