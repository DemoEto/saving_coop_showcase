part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {}

class HomeErrorState extends HomeState {
  final String? code;
  final String? message;

  HomeErrorState({this.code, this.message});
}
