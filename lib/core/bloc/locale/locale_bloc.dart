import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_event.dart';
part 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  static const _key = 'app_locale';

  LocaleBloc() : super(LocaleInitialState(locale: const Locale('th'))) {
    on<LocaleInitEvent>(_onInit);
    on<LocaleChangedEvent>(_onChanged);
  }

  Future<void> _onInit(LocaleInitEvent event, Emitter<LocaleState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_key) ?? 'th';
    emit(LocaleInitialState(locale: Locale(code)));
  }

  Future<void> _onChanged(LocaleChangedEvent event, Emitter<LocaleState> emit) async {
    // 0 = th, 1 = en  (ตามที่ widget ส่งมา)
    final code = event.index == 0 ? 'th' : 'en';
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, code);
    emit(LocaleChangedState(locale: Locale(code)));
  }
}