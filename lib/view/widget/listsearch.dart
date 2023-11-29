import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routesname.dart';
import '../../data/datamodel/itemsmodel.dart';
import '../../linksapi.dart';

class ListSearch extends StatelessWidget {
  final List listSearch;
  const ListSearch({Key? key, required this.listSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.all(8.0),
          child: Text(
            '${listSearch.length} Resultats...',
            style: const TextStyle(fontFamily: 'none', fontSize: 16),
          ),
        ),
        ListView.builder(
          padding: const EdgeInsets.only(top: 5),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: listSearch.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CachedNetworkImage(
                  width: 50,
                  height: 60,
                  imageUrl:
                      "${LinksApi.linkItemsImages}/${ItemsModel.fromJson(listSearch[index]).itemImage}"),
              title: Text('${ItemsModel.fromJson(listSearch[index]).itemName}'),
              trailing: const InkWell(
                child: Icon(Icons.arrow_right_alt_outlined),
              ),
              onTap: () => {
                Get.toNamed(AppRoutes.itemsDetails, arguments: {
                  "itemDetails": ItemsModel.fromJson(listSearch[index])
                })
              },
            );
          },
        ),
      ],
    );
  }
}
