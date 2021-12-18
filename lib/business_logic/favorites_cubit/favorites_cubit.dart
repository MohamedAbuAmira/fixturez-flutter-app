import 'package:bloc/bloc.dart';
import 'package:fixturez/data/models/models.dart';
import 'package:fixturez/data/repository/repository.dart';
import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepository favoritesRepository;
  List<Product> favoritesProducts = [];
  FavoritesCubit(this.favoritesRepository) : super(FavoritesInitial());

  List<Product> getAllSubCategoryProducts() {
    favoritesRepository.getFavoritesProducts().then((favoritesProducts_) {
      emit(FavoritesLoaded(favoritesProducts_)); //sent to ui the state
      this.favoritesProducts = favoritesProducts_;
    });

    return favoritesProducts;
  }
}
