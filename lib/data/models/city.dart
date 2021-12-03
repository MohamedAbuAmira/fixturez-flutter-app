class City {
  late int id;
  late String cityNameEn;
  late String cityNameAr;

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityNameEn = json['name_en'];
    cityNameAr = json['name_ar'];
  }
}
