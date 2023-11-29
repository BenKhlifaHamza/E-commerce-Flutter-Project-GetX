import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/statusrequest.dart';
import '../../data/datamodel/ordermodel.dart';

abstract class TrackingController extends GetxController {
  init();
  //initPolyLine();
  getStreemDeliveryPosition();
  updateDeliveryMarker(LatLng latLangDelivery);
}

class TrackingControllerImp extends TrackingController {
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  Set<Polyline> polylineSet = {};
  LatLng? latLangDelivery;
  late CameraPosition initialCameraPosition;
  late double orderLatitude;
  late double orderLongitude;
  late StatusRequest statusRequest;
  late OrderModel orderModel;
  @override
  void init() async {
    statusRequest = StatusRequest.loading;
    update();
    orderModel = Get.arguments["orderModel"];
    orderLatitude = double.parse(orderModel.addressLat!);
    orderLongitude = double.parse(orderModel.addressLong!);
    markers.add(
      Marker(
          markerId: const MarkerId("2"),
          position: LatLng(orderLatitude, orderLongitude),
          icon: BitmapDescriptor.defaultMarkerWithHue(100)),
    );
    initialCameraPosition = CameraPosition(
      target: LatLng(orderLatitude, orderLongitude),
      zoom: 14,
    );
    getStreemDeliveryPosition();
    await Future.delayed(const Duration(seconds: 2));
    statusRequest = StatusRequest.none;
    //polylineSet =  initPolyLine();
    update();
  }

  @override
  getStreemDeliveryPosition() {
    FirebaseFirestore.instance
        .collection("delivery")
        .doc(orderModel.orderId)
        .snapshots()
        .listen((event) {
      if (event.exists) {
        //print("=================${event.get("latitude")}===================");
        latLangDelivery = LatLng(event.get("latitude"), event.get("longitude"));
        updateDeliveryMarker(latLangDelivery!);
        mapController?.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target:
                  LatLng(latLangDelivery!.latitude, latLangDelivery!.longitude),
              zoom: 17),
        ));
      }
    });
  }

  @override
  updateDeliveryMarker(LatLng? latLangDelivery) {
    latLangDelivery == null
        ? markers.add(Marker(
            markerId: const MarkerId("3"),
            position:
                LatLng(latLangDelivery!.latitude, latLangDelivery.longitude),
          ))
        : markers
            .removeWhere((Marker oldMarker) => oldMarker.markerId.value == "3");
    markers.add(Marker(
      markerId: const MarkerId("3"),
      position: LatLng(latLangDelivery.latitude, latLangDelivery.longitude),
    ));
    update();
  }

  // @override
  // initPolyLine() async {
  //   await Future.delayed(const Duration(seconds: 1));
  //   polylineSet = await getPolyLine(myPosition.latitude, myPosition.longitude,
  //       orderLatitude, orderLongitude);
  //   update();
  // }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
