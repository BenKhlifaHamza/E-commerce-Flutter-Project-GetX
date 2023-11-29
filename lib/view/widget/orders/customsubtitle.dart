import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../../core/constant/color.dart';
import '../../../data/datamodel/ordermodel.dart';

class CustomSubTitle extends StatelessWidget {
  final OrderModel orderModel;
  const CustomSubTitle({Key? key, required this.orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(orderModel.orderDate!,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColor.white)),
        Text(Jiffy(orderModel.orderDate!).fromNow(),
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColor.white))
      ],
    );
  }
}
