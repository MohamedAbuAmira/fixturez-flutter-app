import 'package:fixturez/data/models/models.dart';

class User {
  late int id;
  late String name;
  late String? email;
  late String mobile;
  late String gender;
  late String password;
  late bool active;
  late bool verified;
  late int cityId;
  late int storeId;
  late String? fcmToken;
  late String token;
  late String tokenType;
  late String refreshToken;
  late City city;

  User();

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    active = json['active'];
    verified = json['verified'];
    cityId = json['city_id'];
    storeId = json['store_id'];
    fcmToken = json['fcm_token'];
    token = json['token'];
    tokenType = json['token_type'];
    refreshToken = json['refresh_token'];
    city = City.fromJson(json['city']);
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['email'] = this.email;
  //   data['mobile'] = this.mobile;
  //   data['gender'] = this.gender;
  //   data['active'] = this.active;
  //   data['verified'] = this.verified;
  //   data['city_id'] = this.cityId;
  //   data['store_id'] = this.storeId;
  //   data['fcm_token'] = this.fcmToken;
  //   data['token'] = this.token;
  //   data['token_type'] = this.tokenType;
  //   data['refresh_token'] = this.refreshToken;
  //   if (this.city != null) {
  //     data['city'] = this.city.toJson();
  //   }
  //   return data;
  // }
}
