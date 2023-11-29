import 'package:e_commerce/core/class/handlingdataresultat.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart/cartpagecontroller.dart';
import '../../widget/cart/custombottomnavbar.dart';
import '../../widget/cart/customformcupon.dart';
import '../../widget/cart/customitemcart.dart';
import '../../widget/cart/customtopappbar.dart';

class CartPage extends GetView<CartPageControllerImp> {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: () {
            customFormCupon(controller.cupon, 'Cupon Code', (
                /*confirm function */) {
              controller.getCupon();
            }, (/*cancel function */) {
              Get.back();
              controller.cupon.clear();
            });
          },
          child: const Icon(Icons.discount_outlined),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniStartFloat,
        bottomNavigationBar: GetBuilder<CartPageControllerImp>(
            builder: (controller) => CustomBottomNavBar(
                  textButton: "Place Order",
                  textTotal: "Total Items",
                  total: controller.total.toStringAsFixed(3),
                  delevry: controller.delevery.toStringAsFixed(3),
                  textDelevry: "Delivery",
                  cuponDiscount: controller.cuponModel.cuponDiscount,
                  onPressed: () {
                    controller.goToCheckOutPage();
                  },
                )),
        appBar: CustomTopAppBar.customTopAppBar("My Cart"),
        body: GetBuilder<CartPageControllerImp>(
          init: CartPageControllerImp(),
          builder: (controller) => HandlingDataResultat(
              statusRequest: controller.statusRequest2,
              widget: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.myCart.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomItemCart(
                    cartModel: controller.myCart[index],
                  );
                },
              )),
        ));
  }
}
