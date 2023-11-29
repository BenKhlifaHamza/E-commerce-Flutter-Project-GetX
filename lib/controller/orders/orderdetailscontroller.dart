import 'dart:async';

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/data/datasource/remote/orders/ordersremote.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/functions/handlingdata.dart';
import '../../data/datamodel/orderdetailsmodel.dart';
import '../../data/datamodel/ordermodel.dart';

abstract class OrderDetailsController extends GetxController {
  init();
  getOrderDetails();
}

class OrderDetailsControllerImp extends OrderDetailsController {
  late Set<Marker> markers;
  late CameraPosition kGooglePlex;
  late GlobalKey<FormState> formKey;
  late Completer<GoogleMapController> mapController;
  late OrderModel orderModel;
  late double latitude;
  late double longitude;
  late OrdersRemote ordersRemote;
  late StatusRequest statusRequest;
  late List<OrderDetailsModel> listOrderDetails;
  @override
  init() {
    orderModel = Get.arguments["orderModel"];
    ordersRemote = OrdersRemote(Get.find());
    statusRequest = StatusRequest.none;
    listOrderDetails = [];
    latitude = double.parse(orderModel.addressLat ?? '0');
    longitude = double.parse(orderModel.addressLong ?? '0');
    mapController = Completer<GoogleMapController>();
    kGooglePlex = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 14.4746,
    );
    markers = {
      Marker(
          markerId: const MarkerId("1"), position: LatLng(latitude, longitude)),
    };
    getOrderDetails();
  }

  @override
  getOrderDetails() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersRemote.getOrderDetails(orderModel.orderId!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        listOrderDetails.clear();
        List temp = response['data'];
        listOrderDetails.addAll(temp.map((e) => OrderDetailsModel.fromJson(e)));
        print(listOrderDetails);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
