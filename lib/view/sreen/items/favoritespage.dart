import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart/cartpagecontroller.dart';
import '../../../controller/items/favoritecontroller.dart';
import '../../../core/class/handlingdataresultat.dart';
import '../../widget/itemspage/customcardfavoriteitem.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CartPageControllerImp controllerCart = Get.put(CartPageControllerImp());
    Get.lazyPut(() => FavoriteControllerImp());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: [
          //CustomAppBar(title: "62".tr, notifyBtton: () {}, searchButton: () {}, onChanged: (String ) {  },),
          const SizedBox(
            height: 8,
          ),
          GetBuilder<FavoriteControllerImp>(
              builder: (controllerFavoritesPage) => HandlingDataResultat(
                  statusRequest: controllerFavoritesPage.statusRequest2,
                  widget: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6,
                      ),
                      itemCount: controllerFavoritesPage.allFavorites.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return CustomCardFavoriteItem(
                          controllerFavoritesPage: controllerFavoritesPage,
                          favoritesModel:
                              controllerFavoritesPage.allFavorites[index],
                          controllerCart: controllerCart,
                        );
                      }))),
        ],
      ),
    );
  }
}
