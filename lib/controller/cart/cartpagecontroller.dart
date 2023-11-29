import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/routesname.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datamodel/cartmodel.dart';
import '../../data/datamodel/cuponmodel.dart';
import '../../data/datamodel/ordermodel.dart';
import '../../data/datasource/remote/cart/cartremote.dart';
import '../../data/datasource/remote/cupon/cuponremote.dart';

abstract class CartPageController extends GetxController {
  updateCount(String itemId, String sign);
  addCart(String itemId, String nbrItem);
  removeCart(String itemId);
  deleteCart(String itemId);
  calcTotal();
  initData();
  getCart();
  calcDiscount(double price, double discount);
  getCupon();
  goToCheckOutPage();
}

class CartPageControllerImp extends CartPageController {
  late List<Map<String, dynamic>> items;
  late StatusRequest statusRequest2;
  late StatusRequest statusRequest;
  late MyServices myServices;
  late CartRemote cartRemote;
  late double delevery;
  late String nbrItem;
  late String userId;
  late double total;
  late List allData;
  late List<CartModel> myCart;
  late CuponModel cuponModel;
  late TextEditingController cupon;
  late CuponRemote cuponRemote;
  late OrderModel orderModel;

  @override
  initData() async {
    myServices = Get.find();
    userId = myServices.sharedPreferences.getString('user_id')!;
    cartRemote = CartRemote(Get.find());
    cuponRemote = CuponRemote(Get.find());
    statusRequest2 = StatusRequest.none;
    statusRequest = StatusRequest.none;
    nbrItem = "0";
    cupon = TextEditingController();
    cuponModel = CuponModel();
    orderModel = OrderModel();
    allData = [];
    myCart = [];
    delevery = 10.00;
    total = 0.0;
    await getCart();
    calcTotal();
  }

  @override
  getCupon() async {
    Get.back();
    var response = await cuponRemote.getCuponRemote(cupon.text);
    if (response['status'] == 'success') {
      cuponModel = CuponModel.fromJson(response[('data')]);
    } else {
      cuponModel = CuponModel();
      Get.back();
      Get.defaultDialog(
        title: "Warning",
        middleText: "No coupon with this code.",
        titleStyle: TextStyle(color: AppColor.white),
        middleTextStyle: TextStyle(color: AppColor.white),
        backgroundColor: AppColor.blueGrey,
      );
    }
    calcTotal();
    cupon.clear();
    update();
  }

  @override
  getCart() async {
    statusRequest2 = StatusRequest.loading;
    update();
    var response = await cartRemote.getCart(userId);
    statusRequest2 = handlingData(response);
    if (statusRequest2 == StatusRequest.success) {
      if (response['status'] == 'success') {
        myCart.clear();
        allData.clear();
        allData.addAll(response['data']);
        myCart.addAll(allData.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest2 = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  addCart(itemId, nbrItem) async {
    statusRequest = StatusRequest.loading;
    var response = await cartRemote.addCart(userId, itemId, nbrItem);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            message: "Product added to Cart",
            duration: const Duration(seconds: 1),
            margin: const EdgeInsets.all(8.0),
            borderRadius: 10);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    nbrItem = "0";
    calcTotal();
    update();
  }

  @override
  removeCart(String itemId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartRemote.removeCart(userId, itemId);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            message: "Product removed from Cart",
            duration: const Duration(seconds: 1),
            margin: const EdgeInsets.all(8.0),
            borderRadius: 10);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    calcTotal();
    update();
  }

  @override
  deleteCart(String itemId) {
    cartRemote.deleteCart(userId, itemId);
    myCart.removeWhere((element) => element.itemId == itemId);
    calcTotal();
    update();
  }

  @override
  updateCount(itemId, sign) async {
    int index = 0;
    while (myCart[index].itemId != itemId && index < myCart.length - 1) {
      index++;
    }
    if (index < myCart.length) {
      if (sign == '+') {
        nbrItem = (int.parse(myCart[index].cartCount!) + 1).toString();
        myCart[index].cartCount = nbrItem;
        calcTotal();
        update();
        await addCart(itemId, nbrItem);
      } else if (sign == '-') {
        if (myCart[index].cartCount != "0") {
          myCart[index].cartCount =
              (int.parse(myCart[index].cartCount!) - 1).toString();
          calcTotal();
          update();
          await removeCart(itemId);
        }
      }
    }
  }

  @override
  calcDiscount(double price, double discount) {
    return (price - (price * discount / 100));
  }

  @override
  calcTotal() {
    total = 0.0;
    for (int i = 0; i < myCart.length; i++) {
      double price = calcDiscount(double.parse(myCart[i].itemPrice!),
          double.parse(myCart[i].itemDiscount!));
      int count = int.parse(myCart[i].cartCount!);
      total = total + (count * price);
      update();
    }
    if (cuponModel.cuponDiscount != null && myCart.isNotEmpty) {
      total = calcDiscount(total, double.parse(cuponModel.cuponDiscount!));
    }
  }

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  @override
  goToCheckOutPage() {
    if (myCart.isEmpty) return Get.snackbar("Warning", "Cart Is Empty");
    orderModel.orderDeliveryPrice = delevery.toString();
    orderModel.orderPrice = total.toString();
    orderModel.orderCuponId = cuponModel.cuponId ?? "0";
    Get.toNamed(AppRoutes.checkOutPage, arguments: {"orderModel": orderModel});
  }
}
