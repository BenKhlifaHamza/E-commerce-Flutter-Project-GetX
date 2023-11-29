import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routesname.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/remote/orders/ordersremote.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datamodel/ordermodel.dart';

abstract class OrdersController extends GetxController {
  init();
  getOrders();
  refrechOrderPage();
  goToOrderDetails(OrderModel orderModel);
  deleteOrder(String orderId);
  sendRating(String orderId, String orderRating, String orderComment);
  ratingFun(String orderId);
  goToTracking(OrderModel orderModel);
}

class OrdersControllerImp extends OrdersController {
  late MyServices myServices;
  late OrdersRemote ordersRemote;
  late StatusRequest statusRequest;
  late List<OrderModel> orders;

  @override
  init() {
    myServices = Get.find();
    ordersRemote = OrdersRemote(Get.find());
    statusRequest = StatusRequest.none;
    orders = [];
    getOrders();
  }

  @override
  getOrders() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersRemote
        .getOrders(myServices.sharedPreferences.getString('user_id')!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        orders.clear();
        List temp = response['data'];
        for (var element in temp) {
          orders.add(OrderModel.fromJson(element));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  refrechOrderPage() async {
    var response = await ordersRemote
        .getOrders(myServices.sharedPreferences.getString('user_id')!);
    if (response["status"] == "success") {
      orders.clear();
      List temp = response['data'];
      for (var element in temp) {
        orders.add(OrderModel.fromJson(element));
      }
    }
    update();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  @override
  goToOrderDetails(orderModel) {
    Get.toNamed(AppRoutes.orderDetailsPage,
        arguments: {"orderModel": orderModel});
  }

  @override
  deleteOrder(String orderId) {
    Get.back();
    orders.removeWhere((OrderModel order) => order.orderId == orderId);
    update();
    ordersRemote.deleteOrder(orderId);
  }

  @override
  ratingFun(orderId) {
    final dialog = RatingDialog(
      initialRating: 0,
      title: const Text(
        'Rating For This  Order',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      image: Image.asset(
        AppImageAsset.logo,
        height: 100,
      ),
      submitButtonText: 'Send',
      commentHint: 'Set your comment',
      submitButtonTextStyle: TextStyle(
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 20),
      onSubmitted: (response) {
        // print(
        //     'rating: ${response.rating.toInt().toString()}, comment: ${response.comment}');
        sendRating(
            orderId, response.rating.toInt().toString(), response.comment);
      },
    );
    Get.dialog(dialog);
  }

  @override
  sendRating(orderId, orderRating, orderComment) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await ordersRemote.sendRating(orderId, orderRating, orderComment);
    if (response['status'] == 'success') {
      getOrders();
    }
  }

  @override
  goToTracking(orderModel) {
    print(orderModel.orderId);
    Get.toNamed(AppRoutes.trackingPage, arguments: {"orderModel": orderModel});
  }
}
