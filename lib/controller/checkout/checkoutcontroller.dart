import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routesname.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/remote/addresses/addressesremoute.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../data/datamodel/addressmodel.dart';
import '../../data/datamodel/ordermodel.dart';
import '../../data/datasource/remote/checkout/checkoutsremote.dart';
import '../home/homepagecontroller.dart';

abstract class CheckOutController extends GetxController {
  init();
  paymentMethodeHandling(String paymentMethode);
  deliveryMethodeHandling(String deliveryMethode);
  addressHandling(String addressId);
  getAddresses();
  addOrder();
  verifInformations(OrderModel orderModel);
  goToAddAddress();
}

class CheckOutControllerImp extends CheckOutController {
  String? paymentMethode;
  String? deliveryMethode;
  String? address;
  List<AddressModel>? addresses;
  late AddressesRemote addressesRemote;
  late String userId;
  late MyServices myServices;
  late OrderModel orderModel;
  late CheckOutRemote checkOutRemote;
  late StatusRequest statusRequest;

  @override
  init() {
    addressesRemote = AddressesRemote(Get.find());
    myServices = Get.find();
    checkOutRemote = CheckOutRemote(Get.find());
    userId = myServices.sharedPreferences.getString('user_id')!;
    orderModel = Get.arguments["orderModel"];
    orderModel.orderUserId = userId;
    orderModel.orderAddressId = "0";
    statusRequest = StatusRequest.none;
  }

  @override
  verifInformations(orderModel) {
    if (orderModel.orderPaymentType == null) {
      Get.defaultDialog(
          title: "Warning",
          content: const Text("Please Choose Payment Methode"));
      return false;
    }

    if (orderModel.orderDeliveryType == null) {
      Get.defaultDialog(
          title: "Warning",
          content: const Text("Please Choose Delivery Methode"));
      return false;
    }

    if (orderModel.orderDeliveryType == "0" &&
        orderModel.orderAddressId == "0") {
      Get.defaultDialog(
          title: "Warning", content: const Text("Please Choose One Address"));
      return false;
    }

    return true;
  }

  @override
  addOrder() async {
    if (verifInformations(orderModel)) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkOutRemote.addOrder(orderModel);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          //Get.reloadAll(force: true);
          Get.snackbar("Success", "Order Success");
          Get.offAllNamed(AppRoutes.homeScreen);
          Get.put(HomePageControllerImp());
        } else {
          Get.snackbar("failure", "Order failure, Try Again");
          statusRequest = StatusRequest.none;
          update();
        }
      } else {
        Get.snackbar("failure", "Order failure, Try Again");
        statusRequest = StatusRequest.none;
        update();
      }
    }
  }

  @override
  getAddresses() async {
    var response = await addressesRemote.getAddressesRemote(userId);
    if (response["status"] == 'success') {
      List temp = response["data"];
      addresses = [];
      addresses!.addAll(temp.map((e) => AddressModel.fromJson(e)));
    }
    addresses ??= [];
    update();
  }

  @override
  paymentMethodeHandling(paymentMethode) {
    // 0 => Master Card ;  1 => cash;
    this.paymentMethode = paymentMethode;
    orderModel.orderPaymentType = paymentMethode;
    update();
  }

  @override
  deliveryMethodeHandling(deliveryMethode) {
    // 0 => Delivery  ; 1 => Store ;
    this.deliveryMethode = deliveryMethode;
    orderModel.orderDeliveryType = deliveryMethode;
    print(deliveryMethode);
    update();
  }

  @override
  addressHandling(addressId) {
    address = addressId;
    orderModel.orderAddressId = address;
    update();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  @override
  goToAddAddress() {
    Get.offAndToNamed(AppRoutes.addressesPage);
  }
}
