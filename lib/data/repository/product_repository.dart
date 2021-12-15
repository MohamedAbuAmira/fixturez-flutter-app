import 'package:fixturez/data/models/models.dart';
import 'package:fixturez/data/web_services/web_services.dart';

class ProductRepository {
  final ProductsWebService productsWebService;

  ProductRepository(this.productsWebService);

  Future<Product> getProductDetials() async {
    final productJson = await productsWebService.getProductDetials();

    return Product.fromJson(productJson);
  }
}
