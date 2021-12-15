import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../data/models/models.dart';
import '../../data/repository/repository.dart';
import '../../data/web_services/web_services.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  // Home home;
  HomeCubit(this.homeRepository) : super(HomeInitial());
  Home? home;

  Home? getHome() {
    homeRepository.getHome().then((home_) {
      emit(HomeLoaded(home_)); //sent to ui the state
      this.home = home_;
    });

    return home;
  }
}
