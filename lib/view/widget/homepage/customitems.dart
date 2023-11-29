import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../controller/home/homepagecontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translationdatabase.dart';
import '../../../data/datamodel/itemsmodel.dart';
import '../../../linksapi.dart';
import '../itemspage/customdiscount.dart';

class CustomItems extends StatelessWidget {
  final HomePageControllerImp controllerHomePage;
  final List list;

  const CustomItems(
      {Key? key, required this.controllerHomePage, required this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) => Items(
                itemsModel: ItemsModel.fromJson(list[index]),
                onTap: () {
                  controllerHomePage
                      .goToItemsDetails(ItemsModel.fromJson(list[index]));
                },
              )),
    );
  }
}

class Items extends StatelessWidget {
  final ItemsModel itemsModel;
  final void Function() onTap;
  const Items({Key? key, required this.itemsModel, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          height: 130,
          width: 200,
          imageUrl: "${LinksApi.linkItemsImages}/${itemsModel.itemImage}",
        ),
        Positioned(
          left: 3,
          top: 3,
          child: SizedBox(
              height: 50,
              width: 50,
              child: CustomDiscount(
                discount: itemsModel.itemDiscount!,
              )),
        ),
        Container(
          margin: const EdgeInsets.only(right: 8.0),
          height: 150,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.black.withOpacity(0.3)),
          child: InkWell(
            splashFactory: NoSplash.splashFactory,
            onTap: onTap,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Positioned(
            bottom: 2,
            left: 5,
            child: Text(
              translationDataBase(
                  "${itemsModel.itemNameAr}", "${itemsModel.itemName}"),
              style: TextStyle(
                  color: AppColor.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}
