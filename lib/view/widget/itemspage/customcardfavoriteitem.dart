import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart/cartpagecontroller.dart';
import '../../../controller/items/favoritecontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translationdatabase.dart';
import '../../../data/datamodel/favoritemodel.dart';
import '../../../linksapi.dart';
import 'customdiscount.dart';
import 'customiconbutoon.dart';
import 'custompriceitem.dart';

class CustomCardFavoriteItem extends StatelessWidget {
  final FavoriteControllerImp controllerFavoritesPage;
  final FavoriteModel favoritesModel;
  final CartPageController controllerCart;
  const CustomCardFavoriteItem({
    Key? key,
    required this.controllerFavoritesPage,
    required this.favoritesModel,
    required this.controllerCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 11,
          color: AppColor.itemsColor,
          child: InkWell(
            onTap: () {
              controllerFavoritesPage.goToItemsDetails(favoritesModel);
            },
            child: Container(
              padding: const EdgeInsets.all(7.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 4,
                    child: Hero(
                      tag: favoritesModel.itemId!,
                      child: CachedNetworkImage(
                          imageUrl:
                              "${LinksApi.linkItemsImages}/${favoritesModel.itemImage}"),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      translationDataBase("${favoritesModel.itemNameAr}",
                          "${favoritesModel.itemName}"),
                      style: TextStyle(
                          height: 1,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(5, (index) => const Icon(Icons.star))
                        ],
                      )),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomPriceItem(
                          price: "${favoritesModel.itemPrice} \$",
                          discounted: favoritesModel.itemDiscount == '0',
                        ),
                        CustomIconButton(
                            onPressed: () {
                              controllerCart.addCart(
                                  favoritesModel.itemId!, "1");
                              controllerCart.getCart();
                            },
                            icon: Icons.add_shopping_cart),
                        GetBuilder<FavoriteControllerImp>(
                          builder: (controllerFavorite) => CustomIconButton(
                              onPressed: () {
                                controllerFavorite
                                    .removeFavorite(favoritesModel.favoriteId!);
                              },
                              icon: Icons.delete_forever_outlined),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        CustomDiscount(discount: favoritesModel.itemDiscount!)
      ],
    );
  }
}
