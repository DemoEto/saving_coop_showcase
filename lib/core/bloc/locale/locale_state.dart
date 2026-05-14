// lib/core/bloc/locale/locale_state.dart
part of 'locale_bloc.dart';

abstract class LocaleState {
  final Locale locale;
  const LocaleState({required this.locale});
}

class LocaleInitialState extends LocaleState {
  const LocaleInitialState({required super.locale});
}

class LocaleChangedState extends LocaleState {
  const LocaleChangedState({required super.locale});
}