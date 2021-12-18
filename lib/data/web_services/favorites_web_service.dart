import 'dart:convert';
import 'dart:io';

import 'package:fixturez/core/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../core/prefs/shared_pref_controller.dart';
import 'end_points.dart';

class FavoritesWebService with Helpers {
  Future<List<dynamic>> getFavoritesProducts() async {
    var url = Uri.parse(ApiEndPoints.favoritestUrl);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      'lang': SharedPrefController().language
    });

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['list'] as List;
    } else {
      throw Exception('Failed to load favorits list');
    }
  }

  Future<bool> setFavorite(BuildContext context,
      {required String idProduct}) async {
    var url = Uri.parse(ApiEndPoints.favoritestUrl);
    var response = await http.post(url, body: {
      'product_id': idProduct
    }, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      'lang': SharedPrefController().language
    });
    if (response.statusCode == 200) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
      //TODO: SHARED PREFERENCES - SAVE LOGGED IN USER DATA!!
      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }
    return false;
  }
}
