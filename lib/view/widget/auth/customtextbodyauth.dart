import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String text;

  const CustomTextBodyAuth({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      child: Text(
        text.tr,
        style: Theme.of(context).textTheme.bodyText1,
        textAlign: TextAlign.center,
      ),
    );
  }
}
