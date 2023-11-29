import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart/cartpagecontroller.dart';
import '../../../core/constant/color.dart';
import '../../../data/datamodel/cartmodel.dart';
import '../../../linksapi.dart';

class CustomItemCart extends GetView<CartPageControllerImp> {
  final CartModel cartModel;
  const CustomItemCart({required this.cartModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
              width: 80,
              height: 80,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // image: DecorationImage(
                //   image: NetworkImage(
                //       "${LinksApi.linkItemsImages}/${cartModel.itemImage!}"),
                //   fit: BoxFit.contain,
                // ),
              ),
              child: CachedNetworkImage(
                imageUrl: "${LinksApi.linkItemsImages}/${cartModel.itemImage!}",
                fit: BoxFit.contain,
              )),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: cartModel.itemName!,
                  color: AppColor.black,
                ),
                const SizedBox(height: 8),
                // CustomText(
                //   text: '${cartModel.itemPrice}\$',
                //   color: AppColor.gold,
                // ),
                CustomText(
                  text:
                      '${controller.calcDiscount(double.parse(cartModel.itemPrice!), double.parse(cartModel.itemDiscount!))}\$',
                  color: AppColor.gold,
                )
              ],
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: InkWell(
                  onTap: () {
                    controller.deleteCart(cartModel.itemId!);
                  },
                  child: const Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.red,
                  ),
                ),
              ),
              Column(
                children: [
                  CustomIconButton(
                      icon: Icons.add,
                      onTap: () {
                        controller.updateCount(cartModel.itemId!, '+');
                      }),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      cartModel.cartCount!,
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: "sans",
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  CustomIconButton(
                      icon: Icons.remove,
                      onTap: () {
                        controller.updateCount(cartModel.itemId!, '-');
                      }),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  const CustomIconButton({Key? key, required this.onTap, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        color: Colors.grey,
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  const CustomText({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
    );
  }
}
