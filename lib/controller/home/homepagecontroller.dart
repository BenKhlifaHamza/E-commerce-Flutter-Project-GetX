import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/routesname.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datamodel/itemsmodel.dart';
import '../../data/datasource/remote/homapageremote.dart';

abstract class HomePageController extends GetxController {
  initData();
  getDataHomePage();
  goToItems(int index, String categorieId);
  goToItemsDetails(ItemsModel itemsModel);
  goToNotifications();
  goSearch();
  checkSearch(String val);
  clearSearch();
  divideItems();
}

class HomePageControllerImp extends HomePageController {
  late String? language;
  late String? userId;
  late String? userName;
  late String? userEmail;
  late bool searching;
  late TextEditingController searchController;
  late MyServices myServices;
  late HomePageRemote homePageRemote;
  //List data = [];
  late List categories;
  //late List allItems;
  late List offerList;
  late List topSalesList;
  late List flashList;
  late List listSearch;
  late StatusRequest statusRequest;
  late Map homeData;

  @override
  initData() async {
    searchController = TextEditingController();
    statusRequest = StatusRequest.none;
    searching = false;
    categories = [];
    //allItems = [];
    offerList = [];
    topSalesList = [];
    flashList = [];
    listSearch = [];
    homeData = {
      "homedata_title": "",
      "homedata_body": "",
      "homedata_deliverytime": ""
    };
    myServices = Get.find();
    homePageRemote = HomePageRemote(Get.find());
    language = myServices.sharedPreferences.getString('language');
    userId = myServices.sharedPreferences.getString("user_id");
    userName = myServices.sharedPreferences.getString("user_name");
    userEmail = myServices.sharedPreferences.getString("user_email");

    await getDataHomePage();
    divideItems();
  }

  @override
  getDataHomePage() async {
    statusRequest = StatusRequest.loading;
    var response = await homePageRemote.getData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']);
        // allItems.addAll(response['items']);
        topSalesList.addAll(response['items']);
        homeData = response['homedata'];
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  divideItems() {
    update();
    // offerList
    //     .addAll(allItems.where((element) => element['item_discount'] != "0"));
    offerList.clear();
    flashList.clear();
    for (var element in topSalesList) {
      if (element['item_discount'] != "0") {
        offerList.add(element);
      }
      if (element['item_discount'] == "0") {
        flashList.add(element);
      }
      update();
    }
    offerList.shuffle();
    flashList.shuffle();
    update();
  }

  double? pubPosition(String lang) => language == lang ? -15 : null;

  @override
  goToItems(index, categorieId) {
    Get.toNamed(AppRoutes.itemsPage, arguments: {
      "categories": categories,
      "indexItem": index,
      "categorieId": categorieId
    });
  }

  @override
  goToItemsDetails(itemsModel) {
    Get.toNamed(AppRoutes.itemsDetails, arguments: {"itemDetails": itemsModel});
  }

  @override
  goToNotifications() {
    Get.toNamed(AppRoutes.notificationsPage);
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  checkSearch(val) {
    listSearch.clear();
    val == '' ? searching = false : searching = true;
    update();
  }

  @override
  goSearch() async {
    print('**************SEARCH*******************');
    listSearch.clear();
    if (searchController.text.isNotEmpty) {
      // print(searchController.text);
      var response = await homePageRemote.searchData(searchController.text);
      if (response['status'] == 'success') {
        listSearch.clear();
        listSearch.addAll(response['data']);
        //   print(response['data']);
      }
      update();
    }
  }

  @override
  clearSearch() {
    searchController.clear();
    searching = false;
    update();
  }
}
