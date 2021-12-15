import 'package:bloc/bloc.dart';
import 'package:fixturez/data/models/models.dart';
import 'package:fixturez/data/repository/repository.dart';
import 'package:meta/meta.dart';

part 'sub_category_products_state.dart';

class SubCategoryProductsCubit extends Cubit<SubCategoryProductsState> {
  final SubCategoryProductsRepository subCategoryProductsRepository;
  List<Product> subCategotyProducts = [];
  SubCategoryProductsCubit(this.subCategoryProductsRepository)
      : super(SubCategoryProductsInitial());

  List<Product> getAllSubCategoryProducts() {
    subCategoryProductsRepository
        .getAllSubCategoryProducts()
        .then((subCategoryProducts_) {
      emit(SubCategoryProductsLoaded(
          subCategoryProducts_)); //sent to ui the state
      this.subCategotyProducts = subCategoryProducts_;
    });

    return subCategotyProducts;
  }
}
