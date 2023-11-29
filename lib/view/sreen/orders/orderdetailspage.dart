import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/class/handlingdataresultat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/orders/orderDetailsController.dart';
import '../../../core/constant/color.dart';
import '../../../linksapi.dart';
import '../../widget/orderdetails/customdataprice.dart';
import '../../widget/orderdetails/customrowdata.dart';
import '../../widget/orderdetails/customtexttitlerow.dart';

class OderDetailsPage extends StatelessWidget {
  const OderDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<OrderDetailsControllerImp>(
          builder: (controllerOrderDetails) => HandlingDataResultat(
              statusRequest: controllerOrderDetails.statusRequest,
              widget: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      const TableRow(children: [
                        CustomTextTitlesRow(title: "Image"),
                        CustomTextTitlesRow(title: "Name"),
                        CustomTextTitlesRow(title: "Quantity"),
                        CustomTextTitlesRow(title: "Price"),
                      ]),
                      ...List.generate(
                          controllerOrderDetails.listOrderDetails.length,
                          (index) => TableRow(children: [
                                CachedNetworkImage(
                                  imageUrl:
                                      "${LinksApi.linkItemsImages}/${controllerOrderDetails.listOrderDetails[index].itemImage}",
                                  height: 70,
                                ),
                                Text(
                                  controllerOrderDetails
                                      .listOrderDetails[index].itemName!,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  controllerOrderDetails
                                      .listOrderDetails[index].cartCount!,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "${controllerOrderDetails.listOrderDetails[index].itemPrice}\$",
                                  textAlign: TextAlign.center,
                                )
                              ]))
                    ],
                  ),
                  Divider(
                    color: AppColor.blueGrey,
                  ),
                  CustomDataPrice(
                      title: "Total",
                      data: controllerOrderDetails.orderModel.orderTotalPrice!),
                  CustomRowData(
                      title: "Date",
                      data: controllerOrderDetails.orderModel.orderDate!),
                  CustomRowData(
                      title: "Status",
                      data: controllerOrderDetails.orderModel.orderStatus!),
                  CustomRowData(
                      title: "Address",
                      data: controllerOrderDetails.orderModel.addressName ??
                          "without delivery"),
                  Visibility(
                      visible:
                          controllerOrderDetails.orderModel.orderDeliveryType ==
                              "0",
                      child: Container(
                          padding: const EdgeInsets.all(4.0),
                          height: 250,
                          width: Get.width,
                          child: GoogleMap(
                            markers: controllerOrderDetails.markers,
                            mapType: MapType.normal,
                            initialCameraPosition:
                                controllerOrderDetails.kGooglePlex,
                            onMapCreated: (GoogleMapController controller) {
                              controllerOrderDetails.mapController
                                  .complete(controller);
                            },
                          )))
                ],
              )),
        ),
      ),
    );
  }
}
