import 'package:flutter/material.dart';

class CustomTextForgetPassWordAuth extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  const CustomTextForgetPassWordAuth(
      {Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        alignment: Alignment.centerRight,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        textAlign: TextAlign.end,
      ),
    );
  }
}
