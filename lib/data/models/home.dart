import 'models.dart';

class Home {
  late List<ImagesSlider> slider;
  late List<Category> homeCategory;
  late List<Product> latestProducts;
  late List<Product> famousProducts;
  // Home();
  Home.fromJson(Map<String, dynamic> json) {
    if (json['slider'] != null) {
      slider = <ImagesSlider>[];
      json['slider'].forEach((v) {
        slider.add(ImagesSlider.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      homeCategory = <Category>[];
      json['categories'].forEach((v) {
        homeCategory.add(Category.fromJson(v));
      });
    }
    if (json['latest_products'] != null) {
      latestProducts = <Product>[];
      json['latest_products'].forEach((v) {
        latestProducts.add(Product.fromJson(v));
      });
    }
    if (json['famous_products'] != null) {
      famousProducts = <Product>[];
      json['famous_products'].forEach((v) {
        famousProducts.add(Product.fromJson(v));
      });
    }
  }
}



// class HomeCategory {
//   late int id;
//   late String nameEn;
//   late String nameAr;
//   late String image;
//   late String imageUrl;

//   HomeCategory.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     nameEn = json['name_en'];
//     nameAr = json['name_ar'];
//     image = json['image'];
//     imageUrl = json['image_url'];
//   }
// }
