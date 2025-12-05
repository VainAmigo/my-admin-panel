import 'package:admin_panel/modules/modules.dart';
import 'package:flutter/cupertino.dart';

@immutable
final class AppRouter {
  const AppRouter._();

  static const main = '/main';
  static const authView = '/';
  
  static Route<void> onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      main => CupertinoPageRoute(
          settings: const RouteSettings(name: main),
          builder: (_) => const MainView(),
        ),
      authView => CupertinoPageRoute(
          builder: (_) => const AuthView(),
        ),
      _ => throw Exception('No builder specified for route named: [${settings.name}]'),
    };
  }
}
