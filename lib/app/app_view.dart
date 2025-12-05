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
    
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>.value(value: authRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(create: (context) => AuthBloc(authRepository)),
        ],
        child: const AdminPanel(),
      ),
    );
  }
}

class AdminPanel extends StatelessWidget {
  const AdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      overlayWidgetBuilder: (progress) => const OverlayIndicator(),
      child: MaterialApp(
        title: 'Admin Panel',
        // locale: context.watch<LanguageCubit>().state.currentLocale,
        // localizationsDelegates: AppLocalizations.localizationsDelegates,
        // supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
        theme: const AppTheme().themeData,
      ),
    );
  }
}
