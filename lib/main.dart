import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saving_coop_showcase/injection_container.dart';

import 'core/bloc/locale/locale_bloc.dart';
import 'core/bloc/navigation/navigation_bloc.dart';
import 'core/l10n/app_localizations.dart';
import 'core/routes/app_routes.dart';
import 'core/bloc/auth/auth_bloc.dart';
import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
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
        BlocProvider(
          create: (_) => LocaleBloc()..add(LocaleInitEvent()),
        ),
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
              AppRoutes.shell,
              (route) => false,
            );
          }
        },
        child: BlocBuilder<LocaleBloc, LocaleState>(
          builder: (context, localeState) {
            return MaterialApp(
              title: 'Portfolio App',
              debugShowCheckedModeBanner: false,
              navigatorKey: navigatorKey,
              locale: localeState.locale,
              supportedLocales: const [
                Locale('th'),
                Locale('en'),
              ],
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              theme: AppTheme.lightTheme,
              initialRoute: AppRoutes.splash,
              onGenerateRoute: AppRoutes.onGenerateRoute,
            );
          },
        ),
      ),
    );
  }
}
