class CategoriesModel {
  String? categorieId;
  String? categorieName;
  String? categorieNameAr;
  String? categorieImage;
  String? categorieDateTime;

  CategoriesModel(
      {this.categorieId,
      this.categorieName,
      this.categorieNameAr,
      this.categorieImage,
      this.categorieDateTime});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categorieId = json['categorie_id'];
    categorieName = json['categorie_name'];
    categorieNameAr = json['categorie_name_ar'];
    categorieImage = json['categorie_image'];
    categorieDateTime = json['categorie_date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categorie_id'] = categorieId;
    data['categorie_name'] = categorieName;
    data['categorie_name_ar'] = categorieNameAr;
    data['categorie_image'] = categorieImage;
    data['categorie_date_time'] = categorieDateTime;
    return data;
  }
}
