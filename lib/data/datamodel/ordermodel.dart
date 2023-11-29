class OrderModel {
  String? orderId;
  String? orderUserId;
  String? orderPrice;
  String? orderDeliveryPrice;
  String? orderDeliveryType;
  String? orderPaymentType;
  String? orderDate;
  String? orderCuponId;
  String? orderAddressId;
  String? orderTotalPrice;
  String? orderStatus;
  String? orderRating;
  String? orderComment;
  String? addressId;
  String? addressUserId;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;
  String? addressName;

  OrderModel(
      {this.orderId,
      this.orderUserId,
      this.orderPrice,
      this.orderDeliveryPrice,
      this.orderDeliveryType,
      this.orderPaymentType,
      this.orderDate,
      this.orderCuponId,
      this.orderAddressId,
      this.orderTotalPrice,
      this.orderStatus,
      this.orderRating,
      this.orderComment,
      this.addressId,
      this.addressUserId,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong,
      this.addressName});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderUserId = json['order_user_id'];
    orderPrice = json['order_price'];
    orderDeliveryPrice = json['order_delivery_price'];
    orderDeliveryType = json['order_delivery_type'];
    orderPaymentType = json['order_payment_type'];
    orderDate = json['order_date'];
    orderCuponId = json['order_cupon_id'];
    orderAddressId = json['order_address_id'];
    orderTotalPrice = json['order_total_price'];
    orderStatus = json['order_status'];
    orderRating = json['order_rating'];
    orderComment = json['order_comment'];
    addressId = json['address_id'];
    addressUserId = json['address_user_id'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressName = json['address_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['order_user_id'] = orderUserId;
    data['order_price'] = orderPrice;
    data['order_delivery_price'] = orderDeliveryPrice;
    data['order_delivery_type'] = orderDeliveryType;
    data['order_payment_type'] = orderPaymentType;
    data['order_date'] = orderDate;
    data['order_cupon_id'] = orderCuponId;
    data['order_address_id'] = orderAddressId;
    data['order_total_price'] = orderTotalPrice;
    data['order_status'] = orderStatus;
    data['order_rating'] = orderRating;
    data['order_comment'] = orderComment;
    data['address_id'] = addressId;
    data['address_user_id'] = addressUserId;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    data['address_name'] = addressName;
    return data;
  }
}
