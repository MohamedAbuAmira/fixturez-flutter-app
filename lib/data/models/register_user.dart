import '../../core/constants/constants.dart';

class RegisterUser {
  late String name;
  late String mobile;
  late String gender;
  late String password;
  late String cityId;
  final String storeApiKey = Strings.storeApiKey;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['mobile'] = mobile;
    data['gender'] = gender;
    data['city_id'] = cityId;
    data['password'] = password;
    data['STORE_API_KEY'] = storeApiKey;
    return data;
  }
}
