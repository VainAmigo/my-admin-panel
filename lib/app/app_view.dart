import 'package:admin_panel/config/config.dart';
import 'package:admin_panel/core/core.dart';
import 'package:admin_panel/modules/modules.dart';
import 'package:admin_panel/server/server.dart';
import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final dioClient = DioClient();
    final authRepository = AuthRepository(dioClient);

    return FutureBuilder<PreferencesStorage>(
      future: PreferencesStorage.getInstance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        }

        final storage = snapshot.data!;
        final authStorage = AuthStorage(storage);

        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider<AuthRepository>.value(value: authRepository),
            RepositoryProvider<AuthStorage>.value(value: authStorage),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider<AuthBloc>(
                create: (context) {
                  final bloc = AuthBloc(authRepository, authStorage);
                  // Check if user has saved session
                  bloc.add(const CheckAuthStatus());
                  return bloc;
                },
              ),
            ],
            child: const AdminPanel(),
          ),
        );
      },
    );
  }
}

class AdminPanel extends StatelessWidget {
  const AdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      overlayWidgetBuilder: (progress) => const OverlayIndicator(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          // Show loading while checking auth status
          if (state is AuthInitial || state is AuthLoading) {
            return const MaterialApp(
              home: Scaffold(body: Center(child: CircularProgressIndicator())),
            );
          }

          return MaterialApp(
            title: 'Admin Panel',
            debugShowCheckedModeBanner: false,
            home: state is AuthAuthenticated
                ? const MainView()
                : const AuthView(),
            onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
            theme: const AppTheme().themeData,
          );
        },
      ),
    );
  }
}
