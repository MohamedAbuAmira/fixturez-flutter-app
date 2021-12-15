import 'package:fixturez/data/models/models.dart';
import 'package:fixturez/data/web_services/web_services.dart';

class SubCategoryRepository {
  final SubCategoriesWebService subCategoriesWebService;

  SubCategoryRepository(this.subCategoriesWebService);

  Future<List<SubCategory>> getAllSubCategories() async {
    final subCategories = await subCategoriesWebService.getSubCategories();
    // print(categories.toList());
    return subCategories
        .map((subCategory) => SubCategory.fromJson(subCategory))
        .toList();
  }
}
