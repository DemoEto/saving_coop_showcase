import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth/auth_bloc.dart';
import '../routes/app_routes.dart';
import '../theme/colors.dart';
import '../theme/fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          Navigator.pushReplacementNamed(context, AppRoutes.home);
        } else if (state.status == AuthStatus.unauthenticated) {
          Navigator.pushReplacementNamed(context, AppRoutes.login);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.blueDark3,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.work_outline_rounded,
                  size: 56,
                  color: AppColors.blueDark3,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Saving COOP',
                style: TextStyle(
                  fontSize: AppFontSizes.h1,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: AppFontFamilies.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '#showcase',
                style: TextStyle(
                  fontSize: AppFontSizes.base,
                  color: Colors.white.withOpacity(0.8),
                  fontFamily: AppFontFamilies.primary,
                ),
              ),
              const SizedBox(height: 48),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
