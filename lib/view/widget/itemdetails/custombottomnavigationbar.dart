import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomBottoNavigationBar extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function() onPressed;
  const CustomBottoNavigationBar(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      splashColor: AppColor.transparent,
      highlightColor: AppColor.secondColor,
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: onPressed,
      color: AppColor.tertiaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 15,
                color: AppColor.white,
                fontWeight: FontWeight.bold,
                fontFamily: "sans"),
          ),
          const SizedBox(
            width: 5,
          ),
          Icon(
            icon,
            color: AppColor.white,
          )
        ],
      ),
    );
  }
}
