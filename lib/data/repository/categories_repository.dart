import 'package:fixturez/data/models/models.dart';
import 'package:fixturez/data/web_services/web_services.dart';

class CategoryRepository {
  final CategoriesWebService categoriesWebService;

  CategoryRepository(this.categoriesWebService);

  Future<List<Category>> getAllCategories() async {
    final categories = await categoriesWebService.getCategories();
    // print(categories.toList());
    return categories.map((category) => Category.fromJson(category)).toList();
  }
}
