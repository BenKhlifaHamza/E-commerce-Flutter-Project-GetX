import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home/homepagecontroller.dart';

class CustomAppBar extends GetView<HomePageControllerImp> {
  final String title;
  final void Function() notifyBtton;
  final void Function() searchButton;
  final void Function(String) onChanged;
  final TextEditingController searchController;
  const CustomAppBar(
      {Key? key,
      required this.title,
      required this.notifyBtton,
      required this.searchButton,
      required this.onChanged,
      required this.searchController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        children: [
          Expanded(
              flex: 8,
              child: TextFormField(
                controller: searchController,
                onChanged: onChanged,
                cursorColor: Colors.blueGrey,
                decoration: InputDecoration(
                    hintText: title,
                    suffixIcon: searchController.text.isNotEmpty
                        ? InkWell(
                            onTap: () {
                              //Nesta3mal fel GetView
                              controller.clearSearch();
                            },
                            child: const Icon(Icons.cancel),
                          )
                        : null,
                    suffixIconColor: AppColor.blueGrey,
                    prefixIcon: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: searchButton,
                        icon: const Icon(
                          Icons.search,
                          color: Colors.blueGrey,
                        )),
                    fillColor: Colors.blueGrey[200],
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10))),
              )),
          const SizedBox(
            width: 7,
          ),
          Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 7),
                decoration: BoxDecoration(
                    color: Colors.blueGrey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  icon: const Icon(
                    Icons.notifications_active_outlined,
                    size: 30,
                    color: Colors.blueGrey,
                  ),
                  onPressed: notifyBtton,
                ),
              ))
        ],
      ),
    );
  }
}
