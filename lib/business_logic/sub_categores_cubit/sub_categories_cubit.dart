import 'package:bloc/bloc.dart';
import 'package:fixturez/data/repository/repository.dart';
import 'package:meta/meta.dart';

import '../../data/models/models.dart';

part 'sub_categories_state.dart';

class SubCategoriesCubit extends Cubit<SubCategoriesState> {
  final SubCategoryRepository subCategoryRepository;
  List<SubCategory> subCategories = [];
  SubCategoriesCubit(this.subCategoryRepository)
      : super(SubCategoriesInitial());

  List<SubCategory> getAllSubCategories() {
    subCategoryRepository.getAllSubCategories().then((subCategories_) {
      emit(SubCategoriesLoaded(subCategories_)); //sent to ui the state
      this.subCategories = subCategories_;
    });

    return subCategories;
  }
}
