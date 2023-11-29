import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routesname.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datamodel/favoritemodel.dart';
import '../../data/datasource/remote/items/favoriteremote.dart';
import '../../data/datasource/remote/items/favoritesitem.dart';

abstract class FavoriteController extends GetxController {
  getFavoritesItems();
  addFavorites(String key, String value);
  updateFavorites(String itemId);
  addRemouteFavorite(String itemId);
  deleteRemouteFavorite(String itemId);
  removeFavorite(String favoriteId);
  goToItemsDetails(FavoriteModel favoriteModel);
  initData();
}

class FavoriteControllerImp extends FavoriteController {
  late MyServices myServices;
  late FavoriteData favoriteData = FavoriteData(Get.find());
  late FavoritesView favoritesView = FavoritesView(Get.find());
  late Map<String, String> myFavorites;
  late List<FavoriteModel> allFavorites;
  late List allData;
  late String userId;
  late StatusRequest statusRequest;
  late StatusRequest statusRequest2;

  @override
  getFavoritesItems() async {
    statusRequest2 = StatusRequest.loading;
    update();
    var response = await favoritesView.getFavoritesRemote(userId);
    statusRequest2 = handlingData(response);
    if (statusRequest2 == StatusRequest.success) {
      if (response['status'] == 'success') {
        allFavorites.clear();
        allData.clear();
        allData.addAll(response['data']);
        allFavorites.addAll(allData.map((e) => FavoriteModel.fromJson(e)));
      } else {
        statusRequest2 = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  addFavorites(key, value) {
    //myFavorites.addAll({key: value});
    myFavorites[key] = value;
    update();
  }

  @override
  updateFavorites(itemId) {
    if (myFavorites[itemId] == "1") {
      myFavorites[itemId] = "0";
      deleteRemouteFavorite(itemId);
    } else {
      myFavorites[itemId] = "1";
      addRemouteFavorite(itemId);
    }

    update();
  }

  @override
  addRemouteFavorite(itemId) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavoriteData(userId, itemId);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            message: "Product added to favorites",
            duration: const Duration(seconds: 1),
            margin: const EdgeInsets.all(8.0),
            borderRadius: 10);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  deleteRemouteFavorite(itemId) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.deleteFavoriteData(userId, itemId);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            message: "Product removed from favorites",
            duration: const Duration(seconds: 1),
            margin: const EdgeInsets.all(8.0),
            borderRadius: 10);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  initData() async {
    favoriteData = FavoriteData(Get.find());
    favoritesView = FavoritesView(Get.find());
    myFavorites = {};
    statusRequest = StatusRequest.none;
    statusRequest2 = StatusRequest.none;
    myServices = Get.find();
    userId = myServices.sharedPreferences.getString('user_id')!;
    allData = [];
    allFavorites = [];

    await getFavoritesItems();
  }

  @override
  removeFavorite(favoriteId) {
    favoriteData.removeFavoriteData(favoriteId);
    allFavorites.removeWhere((element) => element.favoriteId == favoriteId);
    update();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  goToItemsDetails(favoriteModel) {
    print(favoriteModel.itemPrice);
    Get.toNamed(AppRoutes.itemsDetails,
        arguments: {'favoriteDetails': favoriteModel});
  }
}
