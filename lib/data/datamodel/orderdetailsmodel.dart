class OrderDetailsModel {
  String? cartId;
  String? cartUserId;
  String? cartItemId;
  String? cartCount;
  String? cartOrderId;
  String? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDescription;
  String? itemDescriptionAr;
  String? itemImage;
  String? itemCount;
  String? itemActive;
  String? itemPrice;
  String? itemDiscount;
  String? itemDate;
  String? itemCategorie;

  OrderDetailsModel(
      {this.cartId,
      this.cartUserId,
      this.cartItemId,
      this.cartCount,
      this.cartOrderId,
      this.itemId,
      this.itemName,
      this.itemNameAr,
      this.itemDescription,
      this.itemDescriptionAr,
      this.itemImage,
      this.itemCount,
      this.itemActive,
      this.itemPrice,
      this.itemDiscount,
      this.itemDate,
      this.itemCategorie});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    cartUserId = json['cart_user_id'];
    cartItemId = json['cart_item_id'];
    cartCount = json['cart_count'];
    cartOrderId = json['cart_order_id'];
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemNameAr = json['item_name_ar'];
    itemDescription = json['item_description'];
    itemDescriptionAr = json['item_description_ar'];
    itemImage = json['item_image'];
    itemCount = json['item_count'];
    itemActive = json['item_active'];
    itemPrice = json['item_price'];
    itemDiscount = json['item_discount'];
    itemDate = json['item_date'];
    itemCategorie = json['item_categorie'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cart_id'] = cartId;
    data['cart_user_id'] = cartUserId;
    data['cart_item_id'] = cartItemId;
    data['cart_count'] = cartCount;
    data['cart_order_id'] = cartOrderId;
    data['item_id'] = itemId;
    data['item_name'] = itemName;
    data['item_name_ar'] = itemNameAr;
    data['item_description'] = itemDescription;
    data['item_description_ar'] = itemDescriptionAr;
    data['item_image'] = itemImage;
    data['item_count'] = itemCount;
    data['item_active'] = itemActive;
    data['item_price'] = itemPrice;
    data['item_discount'] = itemDiscount;
    data['item_date'] = itemDate;
    data['item_categorie'] = itemCategorie;
    return data;
  }
}
