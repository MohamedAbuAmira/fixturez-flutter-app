import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'end_points.dart';

class CityWebService {
  Future<List<dynamic>> getCities() async {
    var url = Uri.parse(ApiEndPoints.citiesUrl);
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.acceptHeader: "application/json",
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['list'] as List;
    } else {
      throw Exception('Failed to load cities');
    }
  }
}
