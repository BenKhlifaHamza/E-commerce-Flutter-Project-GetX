import 'package:e_commerce/controller/home/homepagecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomPub extends GetView<HomePageControllerImp> {
  final String title;
  final String subTitle;
  final String trailing;
  final String deliveryTime;
  const CustomPub(
      {Key? key,
      required this.deliveryTime,
      required this.title,
      required this.subTitle,
      required this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      height: 150,
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                    title: Text(title,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColor.white, fontSize: 20)),
                    subtitle: Text(
                      subTitle,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: AppColor.white, fontSize: 30),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Row(
                    children: [
                      Text(
                        "Delivery In ${deliveryTime}H",
                        style: TextStyle(fontSize: 20, color: AppColor.white),
                      ),
                      Icon(
                        Icons.delivery_dining_outlined,
                        color: AppColor.white,
                        size: 30,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              top: -26,
              right: controller.pubPosition('en'),
              left: controller.pubPosition('ar'),
              child: Container(
                alignment: Alignment.center,
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                    color: AppColor.secondColor,
                    borderRadius: BorderRadius.circular(160)),
                child: Text(
                  trailing,
                  style: TextStyle(color: AppColor.white, fontSize: 40),
                ),
              ))
        ],
      ),
    );
  }
}
