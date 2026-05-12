import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/bloc/auth/auth_bloc.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  @override
  void dispose() {
    _userController.dispose();
    _passController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<LoginBloc>().add(
            LoginSubmittedEvent(
              username: _userController.text.trim(),
              password: _passController.text.trim(),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            context.read<AuthBloc>().add(AuthStatusChanged(true));
            Navigator.pushReplacementNamed(context, AppRoutes.shell);
          }
          if (state is LoginFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: AppColors.red,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is LoginLoadingState;
          final obscure = state.obscurePassword;

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),
                    // Hero icon
                    Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppColors.blueDark3,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.blueDark3.withOpacity(0.35),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.savings_outlined,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'เข้าสู่ระบบ',
                      style: TextStyle(
                        fontSize: AppFontSizes.h1,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                        fontFamily: AppFontFamilies.primary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'สหกรณ์ออมทรัพย์',
                      style: TextStyle(
                        fontSize: AppFontSizes.base,
                        color: AppColors.grey,
                        fontFamily: AppFontFamilies.primary,
                      ),
                    ),
                    const SizedBox(height: 36),
                    // Username field

                    TextFormField(
                      controller: _userController,
                      enabled: !isLoading,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: 'กรอกชื่อผู้ใช้',
                        prefixIcon:
                            Icon(LucideIcons.circleUser, color: AppColors.grey),
                      ),
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? 'กรุณากรอกชื่อผู้ใช้'
                          : null,
                    ),
                    const SizedBox(height: 20),
                    // Password field

                    TextFormField(
                      controller: _passController,
                      enabled: !isLoading,
                      obscureText: obscure,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _submit(context),
                      decoration: InputDecoration(
                        hintText: 'กรอกรหัสผ่าน',
                        prefixIcon:
                            const Icon(LucideIcons.lock, color: AppColors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscure ? LucideIcons.eyeOff : LucideIcons.eye,
                            color: AppColors.grey,
                          ),
                          onPressed: () => context
                              .read<LoginBloc>()
                              .add(LoginObscureToggledEvent()),
                        ),
                      ),
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? 'กรุณากรอกรหัสผ่าน'
                          : null,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {}, child: const Text('ลืมรหัสผ่าน')),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Login button
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: isLoading
                          ? const Center(
                              key: ValueKey('loading'),
                              child: CircularProgressIndicator(),
                            )
                          : ElevatedButton(
                              key: const ValueKey('btn'),
                              onPressed: () => _submit(context),
                              child: const Text('เข้าสู่ระบบ'),
                            ),
                    ),
                    const SizedBox(height: 16),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: ElevatedButton(
                              key: const ValueKey('btn'),
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: AppColors.blueDark3,
                                  side: const BorderSide(
                                      color: AppColors.blueDark3, width: 1),
                                  elevation: 0),
                              child: const Text('สมัครสมาชิกสหกรณ์'),
                            ),
                    ),
                    const SizedBox(height: 16),
                    // Demo hint
                    Center(
                      child: Text(
                        'Demo: admin / 1234',
                        style: TextStyle(
                          fontSize: AppFontSizes.mini,
                          color: AppColors.grey.withOpacity(0.7),
                          fontFamily: AppFontFamilies.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
