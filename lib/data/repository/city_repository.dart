import 'package:fixturez/data/models/models.dart';
import 'package:fixturez/data/web_services/web_services.dart';

class CityRepository {
  final CityWebService cityWebService;

  CityRepository(this.cityWebService);

  Future<List<City>> getAllCities() async {
    final cities = await cityWebService.getCities();
    print(
        'from repository${cities.map((city) => City.fromJson(city)).toList()}');
    return cities.map((city) => City.fromJson(city)).toList();
  }
}
