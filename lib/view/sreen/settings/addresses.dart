import 'package:e_commerce/core/class/handlingdataresultat.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/settings/adresscontroller.dart';
import '../../widget/Adresses/custombottomsheetaddresses.dart';
import '../../widget/Adresses/customdismissebleaddresses.dart';

class AddressesPage extends StatelessWidget {
  const AddressesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddressControllerImp addressController = Get.put(AddressControllerImp());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addressController.initMapParametres();
            customBottomSheetAddresses(addressController, 'Add', null);
          },
          backgroundColor: AppColor.primaryColor,
          splashColor: AppColor.transparent,
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('My Addresses'),
        ),
        body: GetBuilder<AddressControllerImp>(
          builder: (controller) => HandlingDataResultat(
              statusRequest: controller.statusRequest,
              widget: ListView.separated(
                itemCount: addressController.myAddresses.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomDismissibleAddresses(
                      controller: controller,
                      addressModel: controller.myAddresses[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    endIndent: 5,
                    indent: 5,
                  );
                },
              )),
        ));
  }
}
