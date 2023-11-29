import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomTitleText extends StatelessWidget {
  final String title;
  const CustomTitleText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headline1!
          .copyWith(color: AppColor.secondColor, fontSize: 24),
    );
  }
}
