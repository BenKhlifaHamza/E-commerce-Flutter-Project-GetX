import 'package:e_commerce/controller/items/itemsdetailscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart/cartpagecontroller.dart';
import '../../../core/functions/getcolor.dart';
import '../../widget/itemdetails/custombottomnavigationbar.dart';
import '../../widget/itemdetails/customcontainercolor.dart';
import '../../widget/itemdetails/customcontainerdecoration.dart';
import '../../widget/itemdetails/customdescriptiontext.dart';
import '../../widget/itemdetails/customdiscounttext.dart';
import '../../widget/itemdetails/customherowidget.dart';
import '../../widget/itemdetails/customiconbutton.dart';
import '../../widget/itemdetails/custompricewidget.dart';
import '../../widget/itemdetails/customquantitywidget.dart';
import '../../widget/itemdetails/customtitletext.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsDetailsControllerImp controllerItemsDetails =
        Get.put(ItemsDetailsControllerImp());

    CartPageControllerImp controllerCart = Get.put(CartPageControllerImp());

    return Scaffold(
      bottomNavigationBar: CustomBottoNavigationBar(
        title: 'Add To Cart',
        icon: Icons.add_shopping_cart,
        onPressed: () {
          controllerCart.addCart(
              controllerItemsDetails.itemModel.itemId ??
                  controllerItemsDetails.favoriteModel.itemId!,
              controllerItemsDetails.quantity.toString());
        },
      ),
      body: ListView(
        children: [
          Stack(
            children: const [
              CustomContainerDecoration(),
              CustomHeroWidget(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTitleText(
                  title: controllerItemsDetails.itemModel.itemName ??
                      controllerItemsDetails.favoriteModel.itemName!,
                ),
                CustomDescriptionText(
                    description: controllerItemsDetails
                            .itemModel.itemDescription ??
                        controllerItemsDetails.favoriteModel.itemDescription!),
                const SizedBox(
                  height: 10,
                ),
                const CustomTitleText(
                  title: "Colors",
                ),
                Container(
                    padding: const EdgeInsets.only(left: 5, top: 6),
                    child: Row(
                      children: [
                        ...List.generate(
                            controllerItemsDetails.subItems.length,
                            (index) => CustomContainerColor(
                                  color: Color(getColorFromString1(
                                      controllerItemsDetails.subItems[index]
                                          ['code'])),
                                  title: controllerItemsDetails.subItems[index]
                                      ['name'],
                                  active: controllerItemsDetails.subItems[index]
                                      ['active'],
                                ))
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomTitleText(title: "Quantity"),
                    CustomTitleText(title: "Price"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomIconButton(
                            onPressed: () {
                              controllerItemsDetails.removeQuantity();
                            },
                            icon: Icons.remove),
                        GetBuilder<ItemsDetailsControllerImp>(
                            builder: (controller) => CustomQuantityWidget(
                                quantity: controller.quantity.toString())),
                        CustomIconButton(
                            onPressed: () {
                              controllerItemsDetails.addQuantity();
                            },
                            icon: Icons.add),
                      ],
                    ),
                    Row(
                      children: [
                        CustomDiscountText(
                            controllerItemsDetails: controllerItemsDetails),
                        CustomPriceWidget(
                            price: controllerItemsDetails
                                    .itemModel.itemDiscountPrice ??
                                controllerItemsDetails
                                    .calcDiscount(
                                        controllerItemsDetails
                                                .itemModel.itemPrice ??
                                            controllerItemsDetails
                                                .favoriteModel.itemPrice!,
                                        controllerItemsDetails
                                                .itemModel.itemDiscount ??
                                            controllerItemsDetails
                                                .favoriteModel.itemDiscount!)
                                    .toString()),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
