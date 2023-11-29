import 'package:e_commerce/core/class/handlingdatarequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../controller/tracking/trackingcontroller.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TrackingControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tracking My Order"),
      ),
      body: GetBuilder<TrackingControllerImp>(
        builder: (controllerTracking) => HandlingDataRequest(
            statusRequest: controllerTracking.statusRequest,
            widget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GoogleMap(
                //polylines: controllerTrack.polylineSet,
                mapType: MapType.normal,
                initialCameraPosition: controllerTracking.initialCameraPosition,
                markers: controllerTracking.markers,
                onMapCreated: (GoogleMapController controller) {
                  controllerTracking.mapController = controller;
                },
              ),
            )),
      ),
    );
  }
}
