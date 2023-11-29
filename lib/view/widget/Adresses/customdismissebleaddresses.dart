import 'package:e_commerce/data/datamodel/addressmodel.dart';
import 'package:flutter/material.dart';

import '../../../controller/settings/adresscontroller.dart';
import '../../../core/constant/color.dart';
import 'custombottomsheetaddresses.dart';

class CustomDismissibleAddresses extends StatelessWidget {
  final AddressControllerImp controller;
  final AddressModel addressModel;
  const CustomDismissibleAddresses(
      {Key? key, required this.controller, required this.addressModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        onDismissed: (direction) =>
            {controller.deleteAddress(addressModel.addressId!)},
        direction: DismissDirection.endToStart,
        key: ValueKey(addressModel),
        background: Container(
          color: AppColor.red,
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              'Supprimer',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.white),
            ),
          ),
        ),
        child: ListTile(
          title: Text('${addressModel.addressName}'),
          subtitle: Text('${addressModel.addressStreet}'),
          trailing: InkWell(
            onTap: () {
              controller.initMapParametres();
              controller.editAddress(addressModel);
              customBottomSheetAddresses(controller, 'Edit', addressModel);
            },
            child: const Icon(Icons.mode),
          ),
        ));
  }
}
