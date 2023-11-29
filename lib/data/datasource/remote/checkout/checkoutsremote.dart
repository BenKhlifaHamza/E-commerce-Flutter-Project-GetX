import '../../../../core/class/crud.dart';
import '../../../../linksapi.dart';
import '../../../datamodel/ordermodel.dart';

class CheckOutRemote {
  Crud crud;
  CheckOutRemote(this.crud);

  addOrder(OrderModel orderModel) async {
    var response = await crud.postData(LinksApi.addOrder, {
      'order_user_id': orderModel.orderUserId,
      'order_price': orderModel.orderPrice,
      'order_address_id': orderModel.orderAddressId,
      'order_payment_type': orderModel.orderPaymentType,
      'order_cupon_id': orderModel.orderCuponId,
      'order_delivery_price': orderModel.orderDeliveryPrice,
      'order_delivery_type': orderModel.orderDeliveryType
    });
    return response.fold((l) => l, (r) => r);
  }
}
