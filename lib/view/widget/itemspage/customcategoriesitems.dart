import 'package:e_commerce/data/datamodel/categoriesmodel.dart';
import 'package:flutter/material.dart';

import '../../../controller/items/itemspagecontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translationdatabase.dart';

class CustomCategoriesItems extends StatelessWidget {
  final ItemsPageControllerImp controllerItemsPage;
  const CustomCategoriesItems({Key? key, required this.controllerItemsPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      height: 30,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(
                width: 8.0,
              ),
          scrollDirection: Axis.horizontal,
          itemCount: controllerItemsPage.categories.length,
          itemBuilder: (context, index) => Categories(
                categoriesModel: CategoriesModel.fromJson(
                    controllerItemsPage.categories[index]),
                selectedIndex: index,
                controllerItemsPage: controllerItemsPage,
              )),
    );
  }
}

class Categories extends StatelessWidget {
  final ItemsPageControllerImp controllerItemsPage;
  final CategoriesModel categoriesModel;
  final int selectedIndex;
  const Categories(
      {Key? key,
      required this.categoriesModel,
      required this.selectedIndex,
      required this.controllerItemsPage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              color: controllerItemsPage.selectedItem == selectedIndex
                  ? AppColor.primaryColor
                  : AppColor.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColor.primaryColor, width: 2)),
          child: InkWell(
            splashFactory: NoSplash.splashFactory,
            highlightColor: AppColor.transparent,
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              controllerItemsPage.changeCategorie(
                  selectedIndex, categoriesModel.categorieId!);
              controllerItemsPage.goSearch();
            },
            child: Text(
                translationDataBase('${categoriesModel.categorieNameAr}',
                    '${categoriesModel.categorieName}'),
                style: TextStyle(
                    color: controllerItemsPage.selectedItem == selectedIndex
                        ? AppColor.white
                        : AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
          ),
        ),
      ],
    );
  }
}
