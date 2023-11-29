import 'package:e_commerce/core/class/handlingdataresultat.dart';
import 'package:e_commerce/view/widget/listsearch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart/cartpagecontroller.dart';
import '../../../controller/items/favoritecontroller.dart';
import '../../../controller/items/itemspagecontroller.dart';
import '../../../data/datamodel/itemsmodel.dart';
import '../../widget/customappbar.dart';
import '../../widget/itemspage/customcarditems.dart';
import '../../widget/itemspage/customcategoriesitems.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsPageControllerImp itemsPageController =
        Get.put(ItemsPageControllerImp());
    Get.put(CartPageControllerImp());
    FavoriteControllerImp controllerFavorite = Get.put(FavoriteControllerImp());
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            CustomAppBar(
              title: "62".tr,
              notifyBtton: () {},
              searchButton: () => itemsPageController.goSearch(),
              onChanged: (val) => {
                itemsPageController.checkSearch(val),
                itemsPageController.goSearch()
              },
              searchController: itemsPageController.searchController,
            ),
            GetBuilder<ItemsPageControllerImp>(
              builder: (controllerItemsPage) => CustomCategoriesItems(
                  controllerItemsPage: controllerItemsPage),
            ),
            GetBuilder<ItemsPageControllerImp>(
                builder: (controllerItemsPage) => controllerItemsPage.searching
                    ? ListSearch(
                        listSearch: controllerItemsPage.listSearch,
                      )
                    : HandlingDataResultat(
                        statusRequest: controllerItemsPage.statusRequest,
                        widget: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.6,
                            ),
                            itemCount: controllerItemsPage.allIems.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              controllerFavorite.addFavorites(
                                  controllerItemsPage.allIems[index]['item_id'],
                                  controllerItemsPage.allIems[index]
                                      ['favorite']);
                              return CustomCardItem(
                                controllerItemsPage: controllerItemsPage,
                                itemModel: ItemsModel.fromJson(
                                    controllerItemsPage.allIems[index]),
                              );
                            }))),
          ],
        ),
      )),
    );
  }
}
