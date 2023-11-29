import 'package:flutter/material.dart';

class CustomTextFormFiledAuth extends StatelessWidget {
  final TextInputType keyboardType;
  final String hintText;
  final String labelText;
  final IconData icon;
  final bool? obscureText;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final void Function()? onTapIcon;
  const CustomTextFormFiledAuth(
      {Key? key,
      required this.hintText,
      required this.labelText,
      required this.icon,
      required this.controller,
      required this.keyboardType,
      required this.validator,
      this.obscureText,
      this.onTapIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: validator,
        obscureText: obscureText != true ? false : true,
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 15),
            suffixIcon: InkWell(
              onTap: onTapIcon,
              child: Icon(icon),
            ),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(labelText)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30)),
      ),
    );
  }
}
