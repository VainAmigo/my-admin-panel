import 'package:admin_panel/config/config.dart';
import 'package:admin_panel/modules/main/widgets/desktop_side_menu.dart';
import 'package:admin_panel/modules/main/widgets/menu_item_model.dart';
import 'package:admin_panel/modules/main/widgets/mobile_drawer.dart';
import 'package:admin_panel/modules/main/widgets/placeholder_view.dart';
import 'package:admin_panel/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isMenuExpanded = true;
  MenuItem _selectedMenuItem = MenuItem.verification;

  void _toggleMenu() {
    setState(() {
      _isMenuExpanded = !_isMenuExpanded;
    });
  }

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _closeDrawer() {
    _scaffoldKey.currentState?.closeDrawer();
  }

  void _onLogout(BuildContext context) {
    context.read<AuthBloc>().add(const LogoutRequested());
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRouter.authView,
            (Route<dynamic> route) => false,
          );
        }
      },
      child: isMobile
          ? Scaffold(
              key: _scaffoldKey,
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: _openDrawer,
                ),
                title: const Text('Админ панель'),
              ),
              drawer: MobileDrawer(
                selectedMenuItem: _selectedMenuItem,
                onMenuItemSelected: (item) {
                  setState(() {
                    _selectedMenuItem = item;
                  });
                },
                onLogout: () => _onLogout(context),
                onCloseDrawer: _closeDrawer,
              ),
              body: _buildContent(context),
            )
          : Scaffold(
              body: Row(
                children: [
                  DesktopSideMenu(
                    isMenuExpanded: _isMenuExpanded,
                    selectedMenuItem: _selectedMenuItem,
                    onToggleMenu: _toggleMenu,
                    onMenuItemSelected: (item) {
                      setState(() {
                        _selectedMenuItem = item;
                      });
                    },
                    onLogout: () => _onLogout(context),
                  ),
                  Expanded(child: _buildContent(context)),
                ],
              ),
            ),
    );
  }

  /// Построение контента в зависимости от выбранного пункта меню
  Widget _buildContent(BuildContext context) {
    switch (_selectedMenuItem) {
      case MenuItem.avar:
        return const AvarView();
      case MenuItem.analytics:
        return const PlaceholderView(title: 'Аналитика');
      case MenuItem.reports:
        return const PlaceholderView(title: 'Отчеты');
      case MenuItem.accounting:
        return const PlaceholderView(title: 'Бухгалтерия');
      case MenuItem.users:
        return const UsersView();
      case MenuItem.profile:
        return const UserView();
      case MenuItem.notifications:
        return const PlaceholderView(title: 'Уведомления');
      case MenuItem.verification:
        return const VerificationView();
    }
  }
}
