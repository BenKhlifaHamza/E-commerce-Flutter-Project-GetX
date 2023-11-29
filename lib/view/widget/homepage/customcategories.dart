import 'package:e_commerce/data/datamodel/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/home/homepagecontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translationdatabase.dart';
import '../../../linksapi.dart';

class CustomCategories extends GetView<HomePageControllerImp> {
  final HomePageControllerImp controllerHomePage;
  //final void Function() onTap;
  const CustomCategories({Key? key, required this.controllerHomePage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(
                width: 0.0,
              ),
          scrollDirection: Axis.horizontal,
          itemCount: controllerHomePage.categories.length,
          itemBuilder: (context, index) => InkWell(
                // highlightColor: AppColor.transparent,
                splashFactory: NoSplash.splashFactory,
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  controllerHomePage.goToItems(
                      index,
                      CategoriesModel.fromJson(
                              controllerHomePage.categories[index])
                          .categorieId!);
                },
                child: Categories(
                  categoriesModel: CategoriesModel.fromJson(
                      controllerHomePage.categories[index]),
                ),
              )),
    );
  }
}

class Categories extends StatelessWidget {
  final CategoriesModel categoriesModel;
  const Categories({Key? key, required this.categoriesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: 50,
            width: 60,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: AppColor.categoriesColor,
                borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.network(
              height: 50,
              width: 50,
              "${LinksApi.linkCategoriesImages}/${categoriesModel.categorieImage}",
            ),
          ),
        ),
        Text(
          translationDataBase('${categoriesModel.categorieNameAr}',
              '${categoriesModel.categorieName}'),
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: AppColor.secondColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
