import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saving_coop_showcase/core/widgets/shell_screen.dart';
import 'package:saving_coop_showcase/features/scan_qr/presentation/screens/scan_qr_screen.dart';
import 'package:saving_coop_showcase/features/setting/presentation/screens/setting_screen.dart';

import '../../core/bloc/auth/auth_bloc.dart';
import '../../features/general/presentation/screens/general_screen.dart';
import '../../features/home/home.dart';
import '../../features/login/login.dart';
import '../widgets/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String shell = '/shell';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case home:
        return MaterialPageRoute(
          builder: (context) {
            final authBloc = context.read<AuthBloc>();
            return BlocProvider(
              create: (_) => HomeBloc(authBloc: authBloc),
              child: const HomeScreen(),
            );
          },
        );

      case login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => LoginBloc(),
            child: const LoginScreen(),
          ),
        );

      case shell:
        return MaterialPageRoute(
          builder: (_) => const MainShellScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 – Page not found')),
          ),
        );
    }
  }
  static Widget tabScreen(BuildContext context, int tabIndex) {
    switch (tabIndex) {
      case AppTabs.home:
        return BlocProvider(
          create: (_) => HomeBloc(authBloc: context.read<AuthBloc>()),
          child: const HomeScreen(),    
        );

      case AppTabs.general:
        return const GeneralScreen();
        // return BlocProvider(
        //   create: (_) => GeneralBloc(),
        //   child: const GeneralScreen(),
        // );

      case AppTabs.scan:
        return const ScanQrScreen();

      case AppTabs.settings:
        return const SettingScreen();
        // return BlocProvider(
        //   create: (_) => SettingsBloc(),
        //   child: const SettingsScreen(),
        // );

      default:
        return const Center(child: Text('404 – Tab not found'));
    }
  }

}

abstract class AppTabs {
  static const int home     = 0;
  static const int general  = 1;
  static const int scan     = 2;
  static const int settings = 3;
}