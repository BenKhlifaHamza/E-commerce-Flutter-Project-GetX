import '../../../../core/class/crud.dart';
import '../../../../linksapi.dart';

class OrdersRemote {
  Crud crud;
  OrdersRemote(this.crud);

  getOrders(String userId) async {
    var response = await crud.postData(LinksApi.getOrders, {"user_id": userId});
    return response.fold((l) => l, (r) => r);
  }

  getOrderDetails(String orderId) async {
    var response =
        await crud.postData(LinksApi.getOrderDetails, {"order_id": orderId});
    return response.fold((l) => l, (r) => r);
  }

  deleteOrder(String orderId) async {
    var response =
        await crud.postData(LinksApi.deleteOrder, {"order_id": orderId});
    return response.fold((l) => l, (r) => r);
  }

  sendRating(String orderId, String orderRating, String orderComment) async {
    var response = await crud.postData(LinksApi.ratingOrder, {
      "order_id": orderId,
      "order_rating": orderRating,
      "order_comment": orderComment
    });
    return response.fold((l) => l, (r) => r);
  }
}
