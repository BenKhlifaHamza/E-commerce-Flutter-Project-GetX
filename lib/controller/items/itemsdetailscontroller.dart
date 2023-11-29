import 'package:get/get.dart';

import '../../data/datamodel/favoritemodel.dart';
import '../../data/datamodel/itemsmodel.dart';
import '../cart/cartpagecontroller.dart';

abstract class ItemsDetailsController extends GetxController {
  addQuantity();
  removeQuantity();
  initData();
  calcDiscount(String price, String discount);
}

class ItemsDetailsControllerImp extends ItemsDetailsController {
  late CartPageControllerImp controllerCart;
  late ItemsModel itemModel;
  late FavoriteModel favoriteModel;
  late int quantity;

  List subItems = [
    {"id": "1", "name": "Red", "active": "0", "code": "0xffB83026"},
    {"id": "2", "name": "Grey", "active": "0", "code": "0xff5B5B5B"},
    {"id": "3", "name": "Black", "active": "1", "code": "0xff000000"},
  ];

  @override
  calcDiscount(price, discount) {
    return (double.parse(price) -
        (double.parse(price) * double.parse(discount) / 100));
  }

  @override
  addQuantity() {
    quantity++;
    update();
    //controllerCart.addCart(itemModel.itemId!, quantity.toString());
  }

  @override
  removeQuantity() {
    if (quantity > 1) {
      quantity--;
      update();
      // controllerCart.removeCart(itemModel.itemId!);
    }
  }

  @override
  initData() {
    controllerCart = Get.put(CartPageControllerImp());
    quantity = 1;
    itemModel = Get.arguments["itemDetails"] ?? ItemsModel();
    favoriteModel = Get.arguments["favoriteDetails"] ?? FavoriteModel();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
