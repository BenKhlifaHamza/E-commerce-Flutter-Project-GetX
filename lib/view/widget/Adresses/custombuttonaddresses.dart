import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonAddresses extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const CustomButtonAddresses(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: title == 'Add' || title == 'Edit'
              ? const BorderRadius.only(topLeft: Radius.circular(35))
              : const BorderRadius.only(topRight: Radius.circular(35))),
      splashColor: AppColor.transparent,
      onPressed: onPressed,
      child: Text(title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    ));
  }
}
