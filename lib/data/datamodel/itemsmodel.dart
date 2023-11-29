class ItemsModel {
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
  String? categorieId;
  String? categorieName;
  String? categorieNameAr;
  String? categorieImage;
  String? categorieDateTime;
  String? favorite;
  String? itemDiscountPrice;

  ItemsModel({
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
    this.itemCategorie,
    this.categorieId,
    this.categorieName,
    this.categorieNameAr,
    this.categorieImage,
    this.categorieDateTime,
    this.favorite,
    this.itemDiscountPrice,
  });

  ItemsModel.fromJson(Map<String, dynamic> json) {
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
    categorieId = json['categorie_id'];
    categorieName = json['categorie_name'];
    categorieNameAr = json['categorie_name_ar'];
    categorieImage = json['categorie_image'];
    categorieDateTime = json['categorie_date_time'];
    favorite = json['favorite'];
    itemDiscountPrice = json['item_discount_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['categorie_id'] = categorieId;
    data['categorie_name'] = categorieName;
    data['categorie_name_ar'] = categorieNameAr;
    data['categorie_image'] = categorieImage;
    data['categorie_date_time'] = categorieDateTime;
    data['favorite'] = favorite;
    data['item_discount_price'] = itemDiscountPrice;

    return data;
  }
}
