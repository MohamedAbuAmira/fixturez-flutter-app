
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/models.dart';

enum PrefKeys { loggedIn, fullName, email, gender, phoneNumber, token }

class SharedPrefController {
  static final SharedPrefController _instance = SharedPrefController._();

  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance;
  }

  Future<void> initSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save({required User user}) async {
    await _sharedPreferences.setBool(PrefKeys.loggedIn.toString(), true);
    await _sharedPreferences.setString(
        PrefKeys.fullName.toString(), user.name);
    await _sharedPreferences.setString(
        PrefKeys.email.toString(), user.mobile);
    await _sharedPreferences.setString(
        PrefKeys.gender.toString(), user.gender);
    await _sharedPreferences.setString(
        PrefKeys.token.toString(), 'Bearer ' + user.token);
  }

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKeys.loggedIn.toString()) ?? false;

  String get token =>
      _sharedPreferences.getString(PrefKeys.token.toString()) ?? '';

  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }
}




// import 'package:shared_preferences/shared_preferences.dart';

// enum PrefKey { loggedIn, email, phone }

// class SharedPrefController {
//   // Singleton Design Pattern
//   // initilize the constructor JUST ONCE
//   static final SharedPrefController _instance =
//       SharedPrefController._internal();

//   late SharedPreferences _sharedPreferences;
//   SharedPrefController._internal();

//   Future<void> initSharedPref() async {
//     _sharedPreferences = await SharedPreferences.getInstance();
//   }

//   factory SharedPrefController() {
//     return _instance;
//   }

//   Future<void> saveEmail({required String email}) async {
//     // await _sharedPreferences.setBool(PrefKey.loggedIn.toString(), true);
//     await _sharedPreferences.setString(PrefKey.email.toString(), email);
//   }

//   Future<void> savePhoneNumber({required String phone}) async {
//     await _sharedPreferences.setBool(PrefKey.loggedIn.toString(), true);
//     await _sharedPreferences.setString(PrefKey.phone.toString(), phone);
//   }

//   bool get loggedIn =>
//       _sharedPreferences.getBool(PrefKey.loggedIn.toString()) ?? false;

//   String get email =>
//       _sharedPreferences.getString(PrefKey.email.toString()) ?? 'no email';

//   String get phoneNumber =>
//       _sharedPreferences.getString(PrefKey.phone.toString()) ?? 'no phone';

//   Future<bool> removeKey(String key) async {
//     return await _sharedPreferences.remove(key);
//     // return await _sharedPreferences.clear();
//   }

//   Future<bool> logout() async {
//     await removeKey(PrefKey.phone.toString());
//     return await _sharedPreferences.setBool(PrefKey.loggedIn.toString(), false);
//   }
// }
