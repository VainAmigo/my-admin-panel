import 'package:admin_panel/modules/modules.dart';
import 'package:admin_panel/server/server.dart';
import 'package:flutter/material.dart';

@immutable
final class AppRouter {
  const AppRouter._();

  static const main = '/main';
  static const authView = '/';

  // verification
  static const verificationDetail = '/verification/detail';

  // avar
  static const avarRegisterDetail = '/avar/register/detail';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      main => MaterialPageRoute(
        settings: const RouteSettings(name: main),
        builder: (_) => const MainView(),
      ),
      authView => MaterialPageRoute(builder: (_) => const AuthView()),
      avarRegisterDetail => MaterialPageRoute(
        settings: settings,
        builder: (_) => AvarRegisterDetail(
          policyData: settings.arguments as AvarPolicySearchResponse,
        ),
      ),
      verificationDetail => MaterialPageRoute(
        settings: settings,
        builder: (_) => VerificationDetailView(
          verification: settings.arguments as VerificationItem,
        ),
      ),
      _ => throw Exception(
        'No builder specified for route named: [${settings.name}]',
      ),
    };
  }
}
