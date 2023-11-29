import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/settings/adresscontroller.dart';

class CustomMapAddresses extends StatelessWidget {
  const CustomMapAddresses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressControllerImp>(
      builder: (addrController) => Container(
          padding: const EdgeInsets.all(4.0),
          height: 250,
          width: Get.width,
          child: GoogleMap(
            markers: addrController.markers,
            mapType: MapType.normal,
            onTap: (latLng) => addrController.addMarker(latLng),
            initialCameraPosition: addrController.kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              addrController.mapController.complete(controller);
            },
          )),
    );
  }
}
