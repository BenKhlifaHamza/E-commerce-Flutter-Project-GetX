import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomBottomNavBar extends StatelessWidget {
  final String textButton;
  final String textTotal;
  final String textDelevry;
  final String total;
  final String delevry;
  final String? cuponDiscount;
  final Function() onPressed;
  const CustomBottomNavBar(
      {Key? key,
      required this.textButton,
      required this.textTotal,
      required this.total,
      required this.textDelevry,
      required this.delevry,
      required this.cuponDiscount,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: cuponDiscount != null ? 78 : 62,
        decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
            width: 0.5,
            color: AppColor.itemsColor,
          )),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    textDelevry,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 30,
                      child: MaterialButton(
                        splashColor: AppColor.transparent,
                        onPressed: onPressed,
                        child: Text(
                          textButton,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColor.white),
                          textAlign: TextAlign.center,
                        ),
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: CustomPrice(
                    money: delevry,
                  ),
                )
              ],
            ),
            cuponDiscount != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text(
                          "Cupon",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "- $cuponDiscount %",
                          style: TextStyle(
                              color: AppColor.gold,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'sans'),
                          textAlign: TextAlign.right,
                        ),
                      )
                    ],
                  )
                : const SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    textTotal,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomPrice(
                    money: total,
                  ),
                )
              ],
            ),
          ],
        ));
  }
}

class CustomPrice extends StatelessWidget {
  final String money;
  const CustomPrice({Key? key, required this.money}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$money\$",
      style: TextStyle(
          color: AppColor.gold,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'sans'),
      textAlign: TextAlign.right,
    );
  }
}
