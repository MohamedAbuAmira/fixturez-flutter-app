part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CharactersLoaded extends CategoriesState {
  final List<Category> categories;

  CharactersLoaded(this.categories);
}
