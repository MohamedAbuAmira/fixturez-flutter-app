import 'dart:convert';
import 'package:fixturez/data/models/models.dart';
import 'package:http/http.dart' as http;
import 'end_points.dart';

class CityWebService {
  Future<List<dynamic>> getCities() async {
    var url = Uri.parse('https://smart-store.mr-dev.tech/api/cities');
    var response = await http.get(url);
    print(response.statusCode);

    if (response.statusCode == 200) {
      print(response);
      print(response.body.toString());
      return jsonDecode(response.body)['list'] as List;
      // var categoriesJsonArray = jsonDecode(response.body)['list'] as List;
      // return categoriesJsonArray
      //     .map((jsonObject) => City.fromJson(jsonObject))
      //     .toList();
    }
    return [];
  }
}
