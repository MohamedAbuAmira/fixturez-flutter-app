import 'package:fixturez/data/models/models.dart';
import 'package:fixturez/data/web_services/web_services.dart';

class HomeRepository {
  final HomeWebService homeWebService;

  HomeRepository(this.homeWebService);

  Future<Home> getHome() async {
    final homeJson = await homeWebService.getHome();

    return Home.fromJson(homeJson);
  }
}
