part of 'sub_categories_cubit.dart';

@immutable
abstract class SubCategoriesState {}

class SubCategoriesInitial extends SubCategoriesState {}

class SubCategoriesLoaded extends SubCategoriesState {
  final List<SubCategory> subCategories;

  SubCategoriesLoaded(this.subCategories);
}
