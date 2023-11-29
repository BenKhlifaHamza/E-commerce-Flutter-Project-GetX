import 'package:flutter/material.dart';

import '../../../controller/items/itemsdetailscontroller.dart';
import '../../../core/constant/color.dart';

class CustomDiscountText extends StatelessWidget {
  final ItemsDetailsControllerImp controllerItemsDetails;
  const CustomDiscountText({Key? key, required this.controllerItemsDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if ((controllerItemsDetails.itemModel.itemDiscount ??
            controllerItemsDetails.favoriteModel.itemDiscount) ==
        '0') {
      return const Text('');
    }
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: Text(
        "${controllerItemsDetails.itemModel.itemPrice ?? controllerItemsDetails.favoriteModel.itemPrice}\$",
        style: TextStyle(
          decoration: TextDecoration.lineThrough,
          decorationColor: AppColor.black,
          decorationThickness: 2,
          color: AppColor.gold,
          fontFamily: "sans",
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
