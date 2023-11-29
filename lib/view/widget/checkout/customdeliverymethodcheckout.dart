import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CustomDeliveryMethodCheckOut extends StatelessWidget {
  final String imageName;
  final void Function() onTap;
  final bool isSelected;
  const CustomDeliveryMethodCheckOut(
      {Key? key,
      required this.onTap,
      required this.isSelected,
      required this.imageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: AppColor.transparent,
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            color: isSelected ? AppColor.tertiaryColor : AppColor.grey,
            border: Border.all(color: AppColor.secondColor)),
        child: Image.asset(imageName, color: AppColor.white),
      ),
    );
  }
}
