import 'package:fixturez/data/models/models.dart';
import 'package:fixturez/data/web_services/web_services.dart';

class FavoritesRepository {
  final FavoritesWebService favoritesWebService;

  FavoritesRepository(this.favoritesWebService);

  Future<List<Product>> getFavoritesProducts() async {
    final favoritesProductJson =
        await favoritesWebService.getFavoritesProducts();

    return favoritesProductJson
        .map((jsonObject) => Product.fromJson(jsonObject))
        .toList();
  }
}
