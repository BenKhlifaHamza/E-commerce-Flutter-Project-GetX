import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/settings/settingscontroller.dart';
import '../../../core/constant/imageasset.dart';
import '../../widget/settings/customlisttile.dart';
import '../../widget/settings/customstack.dart';

class SettingsPage extends GetView<SettingsControllerImp> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsControllerImp());
    return Scaffold(
      body: ListView(
        children: [
          const CustomStack(imgName: AppImageAsset.profil),
          const SizedBox(
            height: 70,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                children: [
                  ...List.generate(
                      controller.infoSettings.length,
                      (index) => CustomListTile(
                            title: controller.infoSettings[index]["title"],
                            iconData: controller.infoSettings[index]["icon"],
                            onTap: controller.infoSettings[index]["function"],
                          ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
