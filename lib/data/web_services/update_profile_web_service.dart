import 'dart:convert';
import 'dart:io';

import 'package:fixturez/core/helpers/helpers.dart';
import 'package:fixturez/core/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'end_points.dart';

class UpdateProfileWebService with Helpers {
  final Map authBaseResponse = {};

  Future<Map> updateProfile(BuildContext context,
      {required Map<String, String> updateProfileDetails}) async {
    var url = Uri.parse(ApiEndPoints.updateProfileUrl);
    var response = await http.post(url, body: updateProfileDetails, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json',
      'lang': SharedPrefController().language
    });

    authBaseResponse['status'] = jsonDecode(response.body)['status'] as bool;
    authBaseResponse['message'] =
        jsonDecode(response.body)['message'] as String;

    if (response.statusCode == 200) {
      SharedPrefController()
          .updateProfile(updateProfileDetails: updateProfileDetails);
      showSnackBar(
        context: context,
        message: authBaseResponse['message']!,
      );
      return authBaseResponse;
    } else if (response.statusCode == 400) {
      showSnackBar(
        context: context,
        message: authBaseResponse['message']!,
        error: true,
      );
      return authBaseResponse;
    } else {
      showSnackBar(
        context: context,
        message: authBaseResponse['message']!,
        error: true,
      );
      return authBaseResponse;
    }
  }

  Future<Map> changePassword(BuildContext context,
      {required Map<String, String> changetPasswordDetails}) async {
    var url = Uri.parse(ApiEndPoints.changePasswordUrl);
    var response = await http.post(
      url,
      body: changetPasswordDetails,
      headers: {
        HttpHeaders.authorizationHeader: SharedPrefController().token,
        HttpHeaders.acceptHeader: 'application/json',
        'lang': SharedPrefController().language
      },
    );

    authBaseResponse['status'] = jsonDecode(response.body)['status'] as bool;
    authBaseResponse['message'] =
        jsonDecode(response.body)['message'] as String;

    if (response.statusCode == 200) {
      showSnackBar(
        context: context,
        message: authBaseResponse['message']!,
      );
      return authBaseResponse;
    } else if (response.statusCode == 400) {
      showSnackBar(
        context: context,
        message: authBaseResponse['message']!,
        error: true,
      );
      return authBaseResponse;
    } else {
      showSnackBar(
        context: context,
        message: authBaseResponse['message']!,
        error: true,
      );
      return authBaseResponse;
    }
  }
}
