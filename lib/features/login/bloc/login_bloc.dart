import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<LoginObscureToggled>(_onObscureToggled);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    final wasObscure = state.obscurePassword;
    emit(LoginLoading(obscurePassword: wasObscure));

    try {
      // Simulate API call — replace with real repository in production
      await Future.delayed(const Duration(seconds: 2));

      if (event.username == 'admin' && event.password == '1234') {
        emit(const LoginSuccess('dummy_token_123'));
      } else {
        emit(LoginFailure(
          'ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง',
          obscurePassword: wasObscure,
        ));
      }
    } catch (e) {
      emit(LoginFailure(
        'เกิดข้อผิดพลาด: ${e.toString()}',
        obscurePassword: wasObscure,
      ));
    }
  }

  void _onObscureToggled(
    LoginObscureToggled event,
    Emitter<LoginState> emit,
  ) {
    emit(LoginObscureChanged(obscurePassword: !state.obscurePassword));
  }
}
