import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home/homepagecontroller.dart';
import '../../../core/class/handlingdataresultat.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../widget/customappbar.dart';
import '../../widget/homepage/customcategories.dart';
import '../../widget/homepage/customitems.dart';
import '../../widget/homepage/customoffre.dart';
import '../../widget/homepage/custompub.dart';
import '../../widget/listsearch.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());

    return WillPopScope(
        onWillPop: alertExitApp,
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  GetBuilder<HomePageControllerImp>(
                    builder: (controllerHomePage) => CustomAppBar(
                      title: '62'.tr,
                      notifyBtton: () {
                        controllerHomePage.goToNotifications();
                      },
                      searchButton: () {
                        controllerHomePage.goSearch();
                      },
                      onChanged: (val) {
                        controllerHomePage.checkSearch(val);
                        controllerHomePage.goSearch();
                      },
                      searchController: controllerHomePage.searchController,
                    ),
                  ),
                  GetBuilder<HomePageControllerImp>(
                      builder: ((controllerHomePage) => !controllerHomePage
                              .searching
                          ? HandlingDataResultat(
                              statusRequest: controllerHomePage.statusRequest,
                              widget: ListView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  CustomPub(
                                    title: controllerHomePage
                                        .homeData["homedata_body"],
                                    subTitle:
                                        "${controllerHomePage.homeData["homedata_title"]}",
                                    trailing:
                                        "${controllerHomePage.homeData["homedata_discount"]}%",
                                    deliveryTime: controllerHomePage
                                        .homeData["homedata_deliverytime"],
                                  ),
                                  CustomOffre(title: '63'.tr),
                                  CustomCategories(
                                    controllerHomePage: controllerHomePage,
                                  ),
                                  const Divider(
                                    color: Colors.blueGrey,
                                    height: 2,
                                    thickness: 0.5,
                                  ),
                                  CustomOffre(title: '66'.tr),
                                  CustomItems(
                                    controllerHomePage: controllerHomePage,
                                    list: controllerHomePage.offerList,
                                  ),
                                  CustomOffre(title: '64'.tr),
                                  CustomItems(
                                      controllerHomePage: controllerHomePage,
                                      list: controllerHomePage.flashList),
                                  CustomOffre(title: '65'.tr),
                                  CustomItems(
                                      controllerHomePage: controllerHomePage,
                                      list: controllerHomePage.topSalesList),
                                ],
                              ))
                          : ListSearch(
                              listSearch: controllerHomePage.listSearch,
                            )))
                ],
              )),
        ));
  }
}
