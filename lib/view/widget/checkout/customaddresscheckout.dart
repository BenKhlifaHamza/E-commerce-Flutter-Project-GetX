import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomAddressCheckOut extends StatelessWidget {
  final String addressName;
  final String addressStreet;
  final bool isSelected;
  final void Function() onTap;
  const CustomAddressCheckOut(
      {Key? key,
      required this.addressName,
      required this.addressStreet,
      required this.onTap,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: AppColor.transparent,
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Card(
          color: isSelected ? AppColor.tertiaryColor : AppColor.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            title: Text(
              addressName,
              style: TextStyle(
                color: AppColor.white,
              ),
            ),
            subtitle: Text(addressStreet,
                style: TextStyle(
                  color: AppColor.white,
                )),
          ),
        ),
      ),
    );
  }
}
