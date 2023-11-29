import 'package:e_commerce/controller/cart/cartpagecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomTopAppBar {
  static customTopAppBar(String title) {
    return AppBar(
      toolbarHeight: 50,
      backgroundColor: AppColor.transparent,
      elevation: 0,
      // iconTheme: IconThemeData(color: AppColor.black),
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            //style: TextStyle(color: AppColor.grey, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 5,
          ),
          GetBuilder<CartPageControllerImp>(
              builder: (controller) => Container(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                        color: AppColor.red,
                        borderRadius: BorderRadius.circular(180)),
                    child: Text(
                      "${controller.myCart.length}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: "sans"),
                    ),
                  ))
        ],
      ),
    );
  }
}
