import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitialState()) {
    on<LoginSubmittedEvent>(_onLoginSubmitted);
    on<LoginObscureToggledEvent>(_onObscureToggled);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmittedEvent event,
    Emitter<LoginState> emit,
  ) async {
    final wasObscure = state.obscurePassword;
    emit(LoginLoadingState(obscurePassword: wasObscure));

    try {
      // Simulate API call — replace with real repository in production
      await Future.delayed(const Duration(seconds: 2));

      if (event.username == 'admin' && event.password == '1234') {
        emit(const LoginSuccessState('dummy_token_123'));
      } else {
        emit(LoginFailureState(
          'ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง',
          obscurePassword: wasObscure,
        ));
      }
    } catch (e) {
      emit(LoginFailureState(
        'เกิดข้อผิดพลาด: ${e.toString()}',
        obscurePassword: wasObscure,
      ));
    }
  }

  void _onObscureToggled(
    LoginObscureToggledEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(LoginObscureChangedState(obscurePassword: !state.obscurePassword));
  }
}
