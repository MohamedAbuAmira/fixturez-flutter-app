import 'package:fixturez/data/models/models.dart';
import 'package:fixturez/data/web_services/web_services.dart';

class SubCategoryProductsRepository {
  final SubCategoryProductsWebService subCategoryProductsWebService;

  SubCategoryProductsRepository(this.subCategoryProductsWebService);

  Future<List<Product>> getAllSubCategoryProducts() async {
    final subCategoryProducts =
        await subCategoryProductsWebService.getSubCategoryProducts();
    return subCategoryProducts
        .map((subCategoryProduct) => Product.fromJson(subCategoryProduct))
        .toList();
  }
}
