// lib/core/bloc/locale/locale_event.dart
part of 'locale_bloc.dart';

abstract class LocaleEvent {}

class LocaleInitEvent extends LocaleEvent {}

class LocaleChangedEvent extends LocaleEvent {
  final int index; // 0 = th, 1 = en
  LocaleChangedEvent(this.index);
}