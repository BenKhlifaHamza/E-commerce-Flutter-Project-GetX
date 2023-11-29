import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datamodel/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routesname.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/items/itemspageremote.dart';

abstract class ItemsPageController extends GetxController {
  initData();
  changeCategorie(int index, String categorieId);
  getAllItems(String categorieId);
  goToItemsDetails(ItemsModel itemModel);
  checkSearch(String val);
  clearSearch();
  goSearch();
}

class ItemsPageControllerImp extends ItemsPageController {
  late List categories;
  late int selectedItem;
  late StatusRequest statusRequest;
  late List allIems;
  late String categorieId;
  late MyServices myServices;
  late List listSearch;
  late bool searching;
  late TextEditingController searchController;

  ItemsPageRemote itemsPageRemote = ItemsPageRemote(Get.find());

  @override
  getAllItems(categorieId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsPageRemote.getData(
        categorieId, myServices.sharedPreferences.getString("user_id")!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        allIems.clear();
        allIems.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  changeCategorie(index, categorieId) async {
    update();
    selectedItem = index;
    this.categorieId = categorieId;
    //await getAllItems(CategoriesModel.fromJson(categories[index]).categorieId!);
    await getAllItems(this.categorieId);
    update();
  }

  @override
  initData() async {
    statusRequest = StatusRequest.none;
    allIems = [];
    categories = Get.arguments['categories'];
    selectedItem = Get.arguments['indexItem'];
    categorieId = Get.arguments['categorieId'];
    myServices = Get.find();
    listSearch = [];
    searching = false;
    searchController = TextEditingController();

    await getAllItems(categorieId);
  }

  @override
  goToItemsDetails(itemModel) {
    Get.toNamed(AppRoutes.itemsDetails, arguments: {"itemDetails": itemModel});
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  checkSearch(val) {
    val.isNotEmpty ? searching = true : searching = false;
    update();
  }

  @override
  clearSearch() {
    listSearch.clear();
    searching = false;
    update();
  }

  @override
  goSearch() async {
    print('**************SEARCH*******************');
    listSearch.clear();
    if (searchController.text.isNotEmpty) {
      var response = await itemsPageRemote.searchItemWithCategorie(
          searchController.text, categorieId);
      if (response['status'] == 'success') {
        print(response['data']);
        listSearch.clear();
        listSearch.addAll(response['data']);
      }
      update();
    }
  }
}
