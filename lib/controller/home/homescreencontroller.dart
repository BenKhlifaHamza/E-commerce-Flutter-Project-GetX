import 'package:e_commerce/view/sreen/home/homepage.dart';
import 'package:e_commerce/view/sreen/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/sreen/cart/cartpage.dart';
import '../../view/sreen/items/favoritespage.dart';
import '../../view/sreen/orders/orderspage.dart';

abstract class HomeScreenController extends GetxController {
  goToPage(int index);
  initData();
}

class HomeScreenControllerImp extends HomeScreenController {
  late int currentPage;
  late List<Widget> widgets;
  late List informationBottomAppBar;

  @override
  goToPage(int index) {
    currentPage = index;
    update();
    // Get.reloadAll();
  }

  @override
  initData() {
    currentPage = 0;
    widgets = [
      const HomePage(),
      const FavoritesPage(),
      const CartPage(),
      const SettingsPage(),
      const OrdersPage(),
    ];

    // informationBottomAppBar = [
    //   {"title": "Home", "icon": Icons.home, "index": 0},
    //   {"title": "favorites", "icon": Icons.favorite, "index": 1},
    //   {"title": "Settings", "icon": Icons.settings, "index": 2},
    //   {"title": "Orders", "icon": Icons.pending_actions_rounded, "index": 3}
    // ];
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
