import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomOffre extends StatelessWidget {
  final String title;
  const CustomOffre({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline1!
            .copyWith(color: AppColor.primaryColor, fontSize: 24),
      ),
    );
  }
}
