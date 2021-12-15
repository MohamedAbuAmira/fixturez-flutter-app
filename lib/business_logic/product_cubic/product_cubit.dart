import 'package:bloc/bloc.dart';
import 'package:fixturez/data/models/models.dart';
import 'package:fixturez/data/repository/repository.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;
  Product? product;
  ProductCubit(this.productRepository) : super(ProductInitial());

  Product? getProduct() {
    productRepository.getProductDetials().then((product_) {
      emit(ProductLoaded(product_)); //sent to ui the state
      this.product = product_;
    });

    return product;
  }
}
