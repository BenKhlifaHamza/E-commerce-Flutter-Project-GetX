import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomTextFormFieldAdresses extends StatelessWidget {
  final String label;
  final TextEditingController formFieldController;
  final String? Function(String?)? validator;
  const CustomTextFormFieldAdresses({
    Key? key,
    required this.label,
    required this.formFieldController,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        validator: validator,
        controller: formFieldController,
        cursorColor: AppColor.tertiaryColor,
        decoration: InputDecoration(
            floatingLabelStyle: TextStyle(color: AppColor.tertiaryColor),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  label,
                  style: const TextStyle(fontSize: 20),
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: AppColor.tertiaryColor,
                )),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30)),
      ),
    );
  }
}
