part of '../home_cubit/home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final Home home;

  HomeLoaded(this.home);
}
