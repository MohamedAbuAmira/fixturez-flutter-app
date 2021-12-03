import 'package:shared_preferences/shared_preferences.dart';

enum PrefKey { loggedIn, email, phone }

class SharedPrefController {
  // Singleton Design Pattern
  // initilize the constructor JUST ONCE
  static final SharedPrefController _instance =
      SharedPrefController._internal();

  late SharedPreferences _sharedPreferences;
  SharedPrefController._internal();

  Future<void> initSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  factory SharedPrefController() {
    return _instance;
  }

  Future<void> saveEmail({required String email}) async {
    // await _sharedPreferences.setBool(PrefKey.loggedIn.toString(), true);
    await _sharedPreferences.setString(PrefKey.email.toString(), email);
  }

  Future<void> savePhoneNumber({required String phone}) async {
    await _sharedPreferences.setBool(PrefKey.loggedIn.toString(), true);
    await _sharedPreferences.setString(PrefKey.phone.toString(), phone);
  }

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKey.loggedIn.toString()) ?? false;

  String get email =>
      _sharedPreferences.getString(PrefKey.email.toString()) ?? 'no email';

  String get phoneNumber =>
      _sharedPreferences.getString(PrefKey.phone.toString()) ?? 'no phone';

  Future<bool> removeKey(String key) async {
    return await _sharedPreferences.remove(key);
    // return await _sharedPreferences.clear();
  }

  Future<bool> logout() async {
    await removeKey(PrefKey.phone.toString());
    return await _sharedPreferences.setBool(PrefKey.loggedIn.toString(), false);
  }
}
