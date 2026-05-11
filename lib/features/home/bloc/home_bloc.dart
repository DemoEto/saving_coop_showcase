import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/auth/auth_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthBloc _authBloc;
  late final StreamSubscription<AuthState> _authSubscription;

  HomeBloc({required AuthBloc authBloc})
      : _authBloc = authBloc,
        super(HomeInitialState()) {
    on<HomeFetchEvent>(_onFetch);
    on<HomeInitEvent>(_onInit);

    // Listen to global auth changes
    _authSubscription = _authBloc.stream.listen((authState) {
      if (authState.status == AuthStatus.unauthenticated) {
        add(HomeInitEvent());
      }
    });

    // Kick off initial load
    add(HomeFetchEvent());
  }

  Future<void> _onFetch(
    HomeFetchEvent event,
    Emitter<HomeState> emit,
  ) async {
    if (event.showLoading) emit(HomeLoadingState());

    // Simulate data fetch
    await Future.delayed(const Duration(milliseconds: 800));
    emit(HomeLoadedState());
  }

  void _onInit(HomeInitEvent event, Emitter<HomeState> emit) {
    emit(HomeInitialState());
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }
}
