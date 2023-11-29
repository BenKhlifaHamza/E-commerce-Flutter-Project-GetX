import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/binding.dart';
import 'core/localization/changelocalization.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocalController localizationController = Get.put(LocalController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      translations: MyTranslation(),
      locale: localizationController.language,
      theme: localizationController.appTheme,
      initialBinding: MyBindings(),
      getPages: routes,
    );
  }
}
