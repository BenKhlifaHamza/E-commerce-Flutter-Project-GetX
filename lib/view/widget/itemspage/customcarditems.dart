import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/data/datamodel/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart/cartpagecontroller.dart';
import '../../../controller/items/favoritecontroller.dart';
import '../../../controller/items/itemspagecontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translationdatabase.dart';
import '../../../linksapi.dart';
import 'customdiscount.dart';
import 'customiconbutoon.dart';
import 'custompriceitem.dart';

class CustomCardItem extends StatelessWidget {
  final ItemsPageControllerImp controllerItemsPage;
  final ItemsModel itemModel;

  const CustomCardItem({
    Key? key,
    required this.controllerItemsPage,
    required this.itemModel,
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
              controllerItemsPage.goToItemsDetails(itemModel);
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
                      tag: itemModel.itemId!,
                      child: CachedNetworkImage(
                          imageUrl:
                              "${LinksApi.linkItemsImages}/${itemModel.itemImage}"),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      translationDataBase(
                          "${itemModel.itemNameAr}", "${itemModel.itemName}"),
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
                          price: "${itemModel.itemPrice} \$",
                          discounted: itemModel.itemDiscount == '0',
                        ),
                        ////////////////////Add To Cart/////////////////////////
                        GetBuilder<CartPageControllerImp>(
                          builder: (controllerCart) => CustomIconButton(
                              onPressed: () {
                                controllerCart.addCart(itemModel.itemId!, "1");
                              },
                              icon: Icons.add_shopping_cart),
                        ),
                        ////////////////////Add To Favorites/////////////////////////
                        GetBuilder<FavoriteControllerImp>(
                          builder: (controllerFavorite) => CustomIconButton(
                              onPressed: () {
                                controllerFavorite
                                    .updateFavorites(itemModel.itemId!);
                              },
                              icon: controllerFavorite
                                          .myFavorites[itemModel.itemId] ==
                                      "1"
                                  ? Icons.favorite
                                  : Icons.favorite_border),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        CustomDiscount(discount: itemModel.itemDiscount!)
      ],
    );
  }
}
