import 'package:flutter/material.dart';
import '../../../core/class/orderstatus.dart';
import '../../../core/constant/color.dart';
import '../../../data/datamodel/ordermodel.dart';
import 'customsubtitle.dart';
import 'customvisiblebutton.dart';
import 'customvisiblebuttontracking.dart';
import 'customvisibleratingbutton.dart';

class CusomDataOrder extends StatelessWidget {
  final OrderModel orderModel;
  final void Function() onTap;
  final void Function() deleteOrderFun;
  final void Function() ratingFun;
  final void Function() trackingFun;
  const CusomDataOrder(
      {Key? key,
      required this.orderModel,
      required this.onTap,
      required this.deleteOrderFun,
      required this.ratingFun,
      required this.trackingFun})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: OrderStatus.getColorOrder(orderModel.orderStatus!),
      child: ListTile(
        onTap: onTap,
        isThreeLine: true,
        title: Text(orderModel.orderStatus!,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.white)),
        subtitle: CustomSubTitle(orderModel: orderModel),
        trailing: Column(
          children: [
            Text(
              "${orderModel.orderTotalPrice!}\$",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'sans', color: AppColor.white),
            ),
            const SizedBox(
              height: 8,
            ),
            Visibility(
                visible: orderModel.orderStatus == OrderStatus.waiting,
                child: CustomVisibleDeleteButton(
                  onConfirm: deleteOrderFun,
                )),
            Visibility(
                visible: orderModel.orderStatus == OrderStatus.archived &&
                    orderModel.orderRating == "-1",
                child: CustomVisibleRatingButton(
                  onTap: ratingFun,
                )),
            Visibility(
                visible: orderModel.orderStatus == OrderStatus.way,
                child: CustomVisibleButtonTracking(onTap: trackingFun))
          ],
        ),
      ),
    );
  }
}
