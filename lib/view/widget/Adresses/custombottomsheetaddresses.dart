import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/settings/adresscontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/validinputaddress.dart';
import '../../../data/datamodel/addressmodel.dart';
import 'custombuttonaddresses.dart';
import 'custommapaddresses.dart';
import 'customtextformfieldaddresses.dart';

customBottomSheetAddresses(AddressControllerImp addressController,
    String sendButton, AddressModel? adr) {
  return Get.bottomSheet(
    Container(
        decoration: BoxDecoration(
            color: AppColor.blueGrey,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(35))),
        height: 550,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Row(
              children: [
                CustomButtonAddresses(
                    title: sendButton,
                    onPressed: () {
                      sendButton == 'Add'
                          ? addressController.addAddress()
                          : addressController.sendEdit(adr!);
                    }),
                CustomButtonAddresses(
                    title: 'Cancel',
                    onPressed: () {
                      addressController.resetVariables();
                    })
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                  key: addressController.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomTextFormFieldAdresses(
                          label: 'Name',
                          formFieldController: addressController.name,
                          validator: (val) => validInputAddress(val!, 5, 100),
                        ),
                        CustomTextFormFieldAdresses(
                          label: 'City',
                          formFieldController: addressController.city,
                          validator: (val) => validInputAddress(val!, 5, 100),
                        ),
                        CustomTextFormFieldAdresses(
                          label: 'street',
                          formFieldController: addressController.street,
                          validator: (val) => validInputAddress(val!, 5, 100),
                        ),
                      ],
                    ),
                  )),
            ),
            const CustomMapAddresses()
          ],
        )),
    isScrollControlled: true,
    isDismissible: false,
    enableDrag: false,
  );
}
