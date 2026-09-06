part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeFetchEvent extends HomeEvent {
  final bool showLoading;
  HomeFetchEvent({this.showLoading = true});
}

class HomeInitEvent extends HomeEvent {}
