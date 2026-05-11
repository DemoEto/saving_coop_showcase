import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc/navigation/navigation_bloc.dart';
import 'core/routes/app_routes.dart';
import 'core/bloc/auth/auth_bloc.dart';
import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthAppStarted()),
        ),
        BlocProvider(create: (_) => NavigationBloc()),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.unauthenticated) {
            navigatorKey.currentState?.pushNamedAndRemoveUntil(
              AppRoutes.login,
              (route) => false,
            );
          } else if (state.status == AuthStatus.authenticated) {
            navigatorKey.currentState?.pushNamedAndRemoveUntil(
              AppRoutes.home,
              (route) => false,
            );
          }
        },
        child: MaterialApp(
          title: 'Portfolio App',
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          theme: AppTheme.lightTheme,
          initialRoute: AppRoutes.splash,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        ),
      ),
    );
  }
}
