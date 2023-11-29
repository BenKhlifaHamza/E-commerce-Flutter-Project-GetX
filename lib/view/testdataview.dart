import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/testdatacontroller.dart';
import '../core/class/handlingdataresultat.dart';

class TestDataView extends StatelessWidget {
  const TestDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: GetBuilder<TestController>(
            builder: (testController) => HandlingDataResultat(
                  statusRequest: testController.statusRequest,
                  widget: ListView.builder(
                    itemCount: testController.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text("${testController.data[index]}");
                    },
                  ),
                )),
      ),
    ));
  }
}
