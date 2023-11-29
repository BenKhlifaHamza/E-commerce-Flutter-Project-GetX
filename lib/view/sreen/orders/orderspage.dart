import 'package:e_commerce/controller/orders/orderscontroller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/handlingdataresultat.dart';

import '../../widget/orders/customcolumndataorder.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OrdersControllerImp(), fenix: true);
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Orders"),
        ),
        body: GetBuilder<OrdersControllerImp>(
          builder: ((controller) => HandlingDataResultat(
              statusRequest: controller.statusRequest,
              widget: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.orders.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CusomDataOrder(
                      orderModel: controller.orders[index],
                      onTap: () {
                        controller.goToOrderDetails(controller.orders[index]);
                      },
                      deleteOrderFun: () {
                        controller
                            .deleteOrder(controller.orders[index].orderId!);
                      },
                      ratingFun: () {
                        controller.ratingFun(controller.orders[index].orderId!);
                      },
                      trackingFun: () {
                        controller.goToTracking(controller.orders[index]);
                      },
                    );
                  },
                ),
              ))),
        ));
  }
}
