import 'dart:convert';
import 'package:fixturez/core/helpers/helpers.dart';
import 'package:fixturez/data/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'end_points.dart';

class UserWebService with Helpers {
  Future<bool> register(BuildContext context, {required User user}) async {
    var url = Uri.parse(ApiEndPoints.registerUrl);
    print(url.toString());
    print(user.gender);
    var response = await http.post(url, body: {
      'name': user.name,
      'mobile': user.mobile,
      'password': user.password,
      'gender': user.gender,
      'city_id': user.cityId,
    });
    print(response.statusCode);
    if (response.statusCode == 201) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
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
