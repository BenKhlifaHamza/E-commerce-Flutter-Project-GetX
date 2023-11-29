import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items/itemsdetailscontroller.dart';
import '../../../linksapi.dart';

class CustomHeroWidget extends GetView<ItemsDetailsControllerImp> {
  const CustomHeroWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: controller.itemModel.itemId ?? controller.favoriteModel.itemId!,
      child: Center(
        child: CachedNetworkImage(
          height: 300,
          width: 250,
          imageUrl:
              "${LinksApi.linkItemsImages}/${controller.itemModel.itemImage ?? controller.favoriteModel.itemImage}",
        ),
      ),
    );
  }
}
