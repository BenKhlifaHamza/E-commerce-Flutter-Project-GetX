class CuponModel {
  String? cuponId;
  String? cuponCode;
  String? cuponExpDate;
  String? cuponCount;
  String? cuponDiscount;

  CuponModel(
      {this.cuponId,
      this.cuponCode,
      this.cuponExpDate,
      this.cuponCount,
      this.cuponDiscount});

  CuponModel.fromJson(Map<String, dynamic> json) {
    cuponId = json['cupon_id'];
    cuponCode = json['cupon_code'];
    cuponExpDate = json['cupon_exp_date'];
    cuponCount = json['cupon_count'];
    cuponDiscount = json['cupon_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cupon_id'] = cuponId;
    data['cupon_code'] = cuponCode;
    data['cupon_exp_date'] = cuponExpDate;
    data['cupon_count'] = cuponCount;
    data['cupon_discount'] = cuponDiscount;
    return data;
  }
}
