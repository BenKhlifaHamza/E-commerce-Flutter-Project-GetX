import 'dart:async';

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import '../../data/datamodel/addressmodel.dart';
import '../../data/datasource/remote/addresses/addressesremoute.dart';

abstract class AddressController extends GetxController {
  initMapParametres();
  init();
  addMarker(LatLng latLng);
  resetVariables();
  addAddress();
  getAddresses();
  deleteAddress(String addressId);
  editAddress(AddressModel adr);
  sendEdit(AddressModel adr);
}

class AddressControllerImp extends AddressController {
  late Completer<GoogleMapController> mapController;
  late AddressesRemote addressesRemote;
  late List<AddressModel> myAddresses;
  late GlobalKey<FormState> formKey;
  late TextEditingController street;
  late StatusRequest statusRequest;
  late CameraPosition kGooglePlex;
  late TextEditingController name;
  late TextEditingController city;
  late MyServices myServices;
  late Set<Marker> markers;
  late Position position;
  late double longitude;
  late double latitude;

  @override
  init() async {
    statusRequest = StatusRequest.loading;
    myAddresses = [];
    addressesRemote = AddressesRemote(Get.find());
    markers = {};
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    formKey = GlobalKey<FormState>();
    myServices = Get.find();
    position = await Geolocator.getCurrentPosition();
    initMapParametres();
    await getAddresses();
  }

  @override
  initMapParametres() {
    addMarker(LatLng(position.latitude, position.longitude));
    mapController = Completer<GoogleMapController>();
    kGooglePlex = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 14.4746,
    );
  }

  @override
  addMarker(LatLng latLng) {
    markers.clear();
    markers.add(
      Marker(markerId: const MarkerId("1"), position: latLng),
    );
    latitude = latLng.latitude;
    longitude = latLng.longitude;
    update();
  }

  @override
  getAddresses() async {
    var response = await addressesRemote.getAddressesRemote('53');
    statusRequest = handlingData(response);
    update();
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        myAddresses.clear();
        List temp = response['data'];
        for (var element in temp) {
          myAddresses.add(AddressModel.fromJson(element));
          update();
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  addAddress() async {
    FormState formData = formKey.currentState!;
    if (formData.validate()) {
      AddressModel address = AddressModel(
          addressUserId: myServices.sharedPreferences.getString("user_id"),
          addressName: name.text,
          addressCity: city.text,
          addressStreet: street.text,
          addressLat: latitude.toString(),
          addressLong: longitude.toString());

      var response = await addressesRemote.addAddressRemote(address);

      if (response["status"] == 'success') {
        myAddresses.add(address);
        resetVariables();
        await getAddresses();
      } else {
        Get.back();
        Get.defaultDialog(title: "Warning", middleText: "Problem! Try again.");
      }
    }
  }

  @override
  deleteAddress(addressId) async {
    myAddresses.removeWhere((adr) => adr.addressId == addressId);
    update();
    addressesRemote.deleteAddressRemote(addressId);
  }

  @override
  editAddress(adr) async {
    // Hethi bech t7el l form w yabda rempli bel les donneés le9dom
    name.text = adr.addressName!;
    city.text = adr.addressCity!;
    street.text = adr.addressStreet!;
    latitude = double.parse(adr.addressLat!);
    longitude = double.parse(adr.addressLong!);
    addMarker(LatLng(latitude, longitude));
    update();
  }

  @override
  sendEdit(AddressModel adr) async {
    // Hethi bech tab3ath l requette l serveur
    FormState formData = formKey.currentState!;
    if (formData.validate()) {
      AddressModel address = AddressModel(
          addressId: adr.addressId,
          addressName: name.text,
          addressCity: city.text,
          addressStreet: street.text,
          addressLat: latitude.toString(),
          addressLong: longitude.toString());

      var response = await addressesRemote.editAddressRemote(address);

      if (response['status'] == 'success') {
        Get.back();
        await getAddresses();
      } else {
        Get.defaultDialog(title: "Warning", middleText: "Problem! Try again.");
      }
    }
    update();
  }

  @override
  resetVariables() {
    Get.back();
    name.clear();
    city.clear();
    street.clear();
    addMarker(LatLng(position.latitude, position.longitude));
    update();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
