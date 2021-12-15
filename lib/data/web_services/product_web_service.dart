import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../core/prefs/shared_pref_controller.dart';
import 'end_points.dart';

class ProductsWebService {
  final String productId;
  ProductsWebService({
    required this.productId,
  });
  Future<dynamic> getProductDetials() async {
    var url = Uri.parse(ApiEndPoints.productUrl + '/$productId');
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: SharedPrefController().token,
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['object'];
    } else {
      throw Exception('Failed to load produc');
    }
  }
}
