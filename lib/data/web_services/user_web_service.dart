import 'dart:convert';
import 'dart:io';
import 'package:fixturez/core/constants/constants.dart';
import 'package:fixturez/core/helpers/helpers.dart';
import 'package:fixturez/data/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../core/prefs/shared_pref_controller.dart';
import 'end_points.dart';

class UserWebService with Helpers {
  final Map authBaseResponse = {};

  Future<Map> register(BuildContext context,
      {required RegisterUser registerUser}) async {
    var url = Uri.parse(ApiEndPoints.registerUrl);
    var bodyValue = registerUser.toJson();
    var response = await http.post(
      url,
      body: bodyValue,
      headers: {
        'lang': SharedPrefController().language,
      },
    );

    authBaseResponse['status'] = jsonDecode(response.body)['status'] as bool;
    authBaseResponse['message'] =
        jsonDecode(response.body)['message'] as String;

    if (response.statusCode == 201) {
      // int variable
      authBaseResponse['code'] = jsonDecode(response.body)['code'];
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

  Future<Map> activate(BuildContext context,
      {required Map<String, String> activateDetails}) async {
    var url = Uri.parse(ApiEndPoints.activateUrl);
    var response = await http.post(
      url,
      body: activateDetails,
      headers: {
        'lang': SharedPrefController().language,
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

  Future<Map> login(BuildContext context,
      {required Map<String, String> loginDetails}) async {
    var url = Uri.parse(ApiEndPoints.loginUrl);

    var response = await http.post(
      url,
      body: loginDetails,
      headers: {
        'lang': SharedPrefController().language,
      },
    );
    authBaseResponse['status'] = jsonDecode(response.body)['status'] as bool;
    authBaseResponse['message'] =
        jsonDecode(response.body)['message'] as String;

    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body)['data'];
      final User user = User.fromJson(jsonObject);
      SharedPrefController().save(user: user);

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

  Future<Map> logout(
    BuildContext context,
  ) async {
    var url = Uri.parse(ApiEndPoints.logoutUrl);
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: SharedPrefController().token,
        'lang': SharedPrefController().language,
        'X-Requested-With': 'XMLHttpRequest',
      },
    );
    authBaseResponse['status'] = jsonDecode(response.body)['status'] as bool;
    authBaseResponse['message'] =
        jsonDecode(response.body)['message'] as String;

    if (response.statusCode == 200 || response.statusCode == 401) {
      SharedPrefController().clear();
      showSnackBar(
        context: context,
        message: authBaseResponse['message']!,
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

  Future<Map> forgotPassword(BuildContext context,
      {required String phoneNumber}) async {
    var url = Uri.parse(ApiEndPoints.forgotPasswordUrl);
    var response = await http.post(
      url,
      body: {'mobile': phoneNumber},
      headers: {
        'lang': SharedPrefController().language,
      },
    );

    authBaseResponse['status'] = jsonDecode(response.body)['status'] as bool;
    authBaseResponse['message'] =
        jsonDecode(response.body)['message'] as String;

    if (response.statusCode == 200) {
      authBaseResponse['code'] = jsonDecode(response.body)['code'];
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

  Future<Map> resetPassword(BuildContext context,
      {required Map<String, String> resetPasswordDetails}) async {
    var url = Uri.parse(ApiEndPoints.resetPasswordUrl);
    var response = await http.post(
      url,
      body: resetPasswordDetails,
      headers: {
        'lang': SharedPrefController().language,
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
