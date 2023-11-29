import 'package:e_commerce/core/class/handlingdataresultat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/checkout/checkoutcontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../widget/checkout/customaddresscheckout.dart';
import '../../widget/checkout/custombuttoncheckout.dart';
import '../../widget/checkout/customdeliverymethodcheckout.dart';
import '../../widget/checkout/custompaymentmethode.dart';
import '../../widget/checkout/customtitlecheckout.dart';

class CheckOutPage extends GetView<CheckOutControllerImp> {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CheckOutControllerImp());
    return Scaffold(
        bottomNavigationBar: CustomButtonCheckOut(
            text: 'Check Out',
            onPressed: () {
              controller.addOrder();
            }),
        appBar: AppBar(
          title: const Text('Check Out'),
        ),
        body: GetBuilder<CheckOutControllerImp>(
            builder: (controller) => HandlingDataResultat(
                statusRequest: controller.statusRequest,
                widget: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTitleCheckOut(
                        text: 'Choose Payment Methode',
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomPaymentMethod(
                        text: 'Master Card',
                        isSelected: controller.paymentMethode == '0',
                        onTap: () {
                          // 0 => Master card
                          controller.paymentMethodeHandling('0');
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomPaymentMethod(
                        text: 'Cash',
                        isSelected: controller.paymentMethode == '1',
                        onTap: () {
                          // 1 => cash
                          controller.paymentMethodeHandling('1');
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const CustomTitleCheckOut(
                        text: 'Choose Delivery Methode',
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          children: [
                            CustomDeliveryMethodCheckOut(
                              imageName: AppImageAsset.dilevery,
                              onTap: () {
                                // 0 => delivery
                                controller.deliveryMethodeHandling('0');
                                controller.getAddresses();
                              },
                              isSelected: controller.deliveryMethode == '0',
                            ),
                            CustomDeliveryMethodCheckOut(
                              imageName: AppImageAsset.store,
                              onTap: () {
                                // 1 => store
                                controller.deliveryMethodeHandling('1');
                              },
                              isSelected: controller.deliveryMethode == '1',
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                          visible: controller.deliveryMethode == '0',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              const CustomTitleCheckOut(
                                text: 'Choose Your Address',
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                height: 300,
                                width: Get.width,
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 5, right: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColor.tertiaryColor),
                                    borderRadius: BorderRadius.circular(5)),
                                child: controller.addresses == null
                                    ? Lottie.asset(
                                        AppImageAsset.lottieLoading3,
                                      )
                                    : controller.addresses!.isEmpty
                                        ? InkWell(
                                            child: TextButton(
                                                style: const ButtonStyle(
                                                    splashFactory:
                                                        NoSplash.splashFactory),
                                                onPressed: () {
                                                  controller.goToAddAddress();
                                                },
                                                child: Text(
                                                  "Add Address From Here",
                                                  style: TextStyle(
                                                      color: AppColor
                                                          .tertiaryColor),
                                                )),
                                          )
                                        : ListView.builder(
                                            itemCount:
                                                controller.addresses!.length,
                                            itemBuilder: (context, index) =>
                                                CustomAddressCheckOut(
                                                  addressName: controller
                                                      .addresses![index]
                                                      .addressName!,
                                                  addressStreet: controller
                                                      .addresses![index]
                                                      .addressStreet!,
                                                  isSelected:
                                                      controller.address ==
                                                          controller
                                                              .addresses![index]
                                                              .addressId,
                                                  onTap: () {
                                                    controller.addressHandling(
                                                        controller
                                                            .addresses![index]
                                                            .addressId!);
                                                  },
                                                )),
                              )
                            ],
                          ))
                    ],
                  ),
                ))));
  }
}
