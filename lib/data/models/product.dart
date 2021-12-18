import 'package:fixturez/data/models/models.dart';

class Product {
  late int id;
  late String nameEn;
  late String nameAr;
  late String infoEn;
  late String infoAr;
  late int price;
  late int quantity;
  late int overalRate;
  late int subCategoryId;
  late int productRate;
  late num? offerPrice;
  late bool isFavorite;
  late String imageUrl;
  late List<ImagesSlider> images;
  // late SubCategory? subCategory;
  // late Pivot pivot;

  //TODO Remove this when fetch data From API
  Product();

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    price = json['price'];
    quantity = json['quantity'];
    overalRate = json['overal_rate'];
    subCategoryId = json['sub_category_id'];
    productRate = json['product_rate'];
    offerPrice = json['offer_price'];
    isFavorite = json['is_favorite'];
    imageUrl = json['image_url'];
    if (json['images'] != null) {
      images = <ImagesSlider>[];
      json['images'].forEach((v) {
        images.add(ImagesSlider.fromJson(v));
      });
    } else {
      images = [];
    }

    // subCategory = json['sub_category'] != null
    //     ? SubCategory.fromJson(json['sub_category'])
    //     : null;
    // if (json['pivot'] != null) {
    //   Pivot.fromJson(json['pivot']);
    // } else {
    //   pivot = Pivot.fromJson({"user_id": '', "product_id": ''});
    // }
    // pivot = (json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null)!;
  }
}

class Pivot {
  late int userId;
  late int productId;

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    productId = json['product_id'];
  }
}
