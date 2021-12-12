import 'package:bloc/bloc.dart';
import 'package:fixturez/data/repository/categories_repository.dart';
import 'package:meta/meta.dart';

import '../../data/models/models.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoryRepository categoryRepository;
  List<Category> categories = [];
  CategoriesCubit(this.categoryRepository) : super(CategoriesInitial());

  List<Category> getAllCategories() {
    categoryRepository.getAllCategories().then((categories_) {
      emit(CharactersLoaded(categories_)); //sent to ui the state
      this.categories = categories_;
    });

    return categories;
  }
}
