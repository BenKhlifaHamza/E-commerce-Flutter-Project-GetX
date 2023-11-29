import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/homescreencontroller.dart';
import '../../../core/constant/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());

    return GetBuilder<HomeScreenControllerImp>(
        builder: (controllerHomeScreen) => Scaffold(
              bottomNavigationBar: ConvexAppBar(
                backgroundColor: AppColor.primaryColor,
                height: 52,
                activeColor: AppColor.white,
                items: [
                  TabItem(icon: Icons.home, title: '61'.tr),
                  TabItem(icon: Icons.favorite, title: '59'.tr),
                  TabItem(icon: Icons.shopping_cart, title: '60'.tr),
                  TabItem(icon: Icons.settings, title: '58'.tr),
                  TabItem(icon: Icons.pending_actions_rounded, title: '57'.tr),
                ],
                onTap: (int i) {
                  controllerHomeScreen.goToPage(i);
                },
              ),
              body: controllerHomeScreen
                  .widgets[controllerHomeScreen.currentPage],
            ));
  }
}

///////////////////////////////////////////////////////////////////////////////

// import 'package:e_commerce/core/constant/color.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../controller/home/homescreencontroller.dart';
// import '../../widget/homescreen/custombuttonnavbar.dart';
// import '../../widget/homescreen/customfloatactionbutton.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeScreenControllerImp());
//     return GetBuilder<HomeScreenControllerImp>(
//       builder: (controllerHomeScreen) => Scaffold(
//         backgroundColor: AppColor.white,
//         floatingActionButton:
//             CustomFloatActionButton(controllerHomeScreen: controllerHomeScreen),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         bottomNavigationBar: BottomAppBar(
//             color: AppColor.primaryColor,
//             shape: const CircularNotchedRectangle(),
//             notchMargin: 10,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ...List.generate(
//                     controllerHomeScreen.informationBottomAppBar.length + 1,
//                     (i) {
//                   int index = i > 2 ? i - 1 : i;
//                   return i == 2
//                       ? const Spacer()
//                       : CustomButtonNavBar(
//                           onPressed: () {
//                             controllerHomeScreen.goToPage(index);
//                           },
//                           title: controllerHomeScreen
//                               .informationBottomAppBar[index]['title'],
//                           icon: controllerHomeScreen
//                               .informationBottomAppBar[index]['icon'],
//                           active: controllerHomeScreen.currentPage == index
//                               ? true
//                               : false);
//                 })
//               ],
//             )),
//         body: controllerHomeScreen.widgets[controllerHomeScreen.currentPage],
//       ),
//     );
//   }
// }
