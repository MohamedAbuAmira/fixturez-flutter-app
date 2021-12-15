part of 'sub_category_products_cubit.dart';

@immutable
abstract class SubCategoryProductsState {}

class SubCategoryProductsInitial extends SubCategoryProductsState {}

class SubCategoryProductsLoaded extends SubCategoryProductsState {
  final List<Product> subCategoryProducts;

  SubCategoryProductsLoaded(this.subCategoryProducts);
}
