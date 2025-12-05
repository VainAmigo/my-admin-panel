import 'package:admin_panel/config/config.dart';
import 'package:admin_panel/core/core.dart';
import 'package:admin_panel/modules/modules.dart';
import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            _onLoginSuccess();
          } else if (state is AuthError) {
            _onLoginFailed(state.message);
          }
        },
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizing.spaceBtwSection,
              ),
              child: Responsive(
                mobile: AuthWidget(
                  phoneController: _phoneController,
                  passwordController: _passwordController,
                  onTapLogin: () => _onTapLogin(),
                ),
                tablet: AuthWidget(
                  phoneController: _phoneController,
                  passwordController: _passwordController,
                  width: .4,
                  onTapLogin: () => _onTapLogin(),
                ),
                desktop: AuthWidget(
                  phoneController: _phoneController,
                  passwordController: _passwordController,
                  width: .25,
                  onTapLogin: () => _onTapLogin(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onLoginSuccess() {
    AppSnackbar.showSuccess(context: context, title: 'Вы авторизованы');
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRouter.main,
      (Route<dynamic> route) => false,
    );
  }

  void _onLoginFailed(String? mjs) {
    AppSnackbar.showError(
      context: context,
      title: mjs ?? 'Что то пошле не так',
      message: mjs == null ? 'Ошибка при авторизации' : null,
    );
  }

  void _onTapLogin() {
    final username = _phoneController.text.trim().replaceAll(' ', '').replaceAll('+', '');
    final password = _passwordController.text;
    context.read<AuthBloc>().add(
      LoginRequested(username: username, password: password),
    );
  }
}
