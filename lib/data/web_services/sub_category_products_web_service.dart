import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../core/prefs/shared_pref_controller.dart';
import 'end_points.dart';

class SubCategoryProductsWebService {
  final String subCategoryId;
  SubCategoryProductsWebService({
    required this.subCategoryId,
  });
  Future<List<dynamic>> getSubCategoryProducts() async {
    var url = Uri.parse(ApiEndPoints.subCategoriesUrl + '/$subCategoryId');
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: SharedPrefController().token,
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['list'] as List;
    } else {
      throw Exception('Failed to load sub categories');
    }
  }
}
