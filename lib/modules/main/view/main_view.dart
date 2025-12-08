import 'package:admin_panel/config/config.dart';
import 'package:admin_panel/core/core.dart';
import 'package:admin_panel/modules/modules.dart';
import 'package:admin_panel/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum MenuItem {
  analytics,
  reports,
  accounting,
  avar,
  verification,
  users,
  profile,
  notifications,
}

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
    final isDesktop = Responsive.isDesktop(context);

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
              drawer: _buildMobileDrawer(context),
              body: _buildContent(context),
            )
          : Scaffold(
              body: Row(
                children: [
                  _buildDesktopSideMenu(context, isDesktop),
                  Expanded(child: _buildContent(context)),
                ],
              ),
            ),
    );
  }

  Widget _buildMobileDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: AppColors.primary),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/ayu_logo.png'),
                IconButton(
                  icon: const Icon(Icons.close, color: AppColors.white),
                  onPressed: _closeDrawer,
                ),
              ],
            ),
          ),
          Expanded(child: _buildMenuItems(context)),
        ],
      ),
    );
  }

  Widget _buildDesktopSideMenu(BuildContext context, bool isDesktop) {
    final menuWidth = _isMenuExpanded ? 250.0 : 80.0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: menuWidth,
      decoration: const BoxDecoration(color: AppColors.white),
      child: Column(
        children: [
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(color: AppColors.primary75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_isMenuExpanded)
                  Image.asset('assets/images/ayu_logo.png')
                else
                  const SizedBox.shrink(),
                IconButton(
                  icon: Icon(
                    _isMenuExpanded ? Icons.chevron_left : Icons.chevron_right,
                    color: AppColors.white,
                  ),
                  onPressed: _toggleMenu,
                ),
              ],
            ),
          ),
          Expanded(child: _buildMenuItems(context)),
        ],
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    // Get user roles from AuthBloc
    final authState = context.watch<AuthBloc>().state;
    final List<UserRole> userRoles;

    if (authState is AuthAuthenticated) {
      userRoles = UserRole.fromStringList(authState.authResponse.roles);
    } else {
      userRoles = [];
    }

    final allMenuItems = [
      _MenuItem(
        icon: 'assets/icons/icon_analytics.svg',
        title: 'Аналитика',
        menuItem: MenuItem.analytics,
        allowedRoles: [UserRole.admin],
        onTap: () {
          setState(() {
            _selectedMenuItem = MenuItem.analytics;
          });
        },
      ),
      _MenuItem(
        icon: 'assets/icons/icon_reports.svg',
        title: 'Отчеты',
        menuItem: MenuItem.reports,
        allowedRoles: [UserRole.admin],
        onTap: () {
          setState(() {
            _selectedMenuItem = MenuItem.reports;
          });
        },
      ),
      _MenuItem(
        icon: 'assets/icons/icon_accounting.svg',
        title: 'Бухгалтерия',
        menuItem: MenuItem.accounting,
        allowedRoles: [UserRole.admin],
        onTap: () {
          setState(() {
            _selectedMenuItem = MenuItem.accounting;
          });
        },
      ),
      _MenuItem(
        icon: 'assets/icons/icon_avar.svg',
        title: 'Аварийные комиссар',
        menuItem: MenuItem.avar,
        allowedRoles: [UserRole.admin, UserRole.avar],
        onTap: () {
          setState(() {
            _selectedMenuItem = MenuItem.avar;
          });
        },
      ),
      _MenuItem(
        icon: 'assets/icons/icon_verification.svg',
        title: 'Верификация',
        menuItem: MenuItem.verification,
        allowedRoles: [UserRole.admin],
        onTap: () {
          setState(() {
            _selectedMenuItem = MenuItem.verification;
          });
        },
      ),
      _MenuItem(
        icon: 'assets/icons/icon_persons.svg',
        title: 'Пользователи',
        menuItem: MenuItem.users,
        allowedRoles: [UserRole.admin],
        onTap: () {
          setState(() {
            _selectedMenuItem = MenuItem.users;
          });
        },
      ),
      _MenuItem(
        icon: 'assets/icons/icon_person.svg',
        title: 'Профиль',
        menuItem: MenuItem.profile,
        allowedRoles: [UserRole.admin],
        onTap: () {
          setState(() {
            _selectedMenuItem = MenuItem.profile;
          });
        },
      ),
      _MenuItem(
        icon: 'assets/icons/icon_notification.svg',
        title: 'Уведомления',
        menuItem: MenuItem.notifications,
        allowedRoles: [UserRole.admin],
        onTap: () {
          setState(() {
            _selectedMenuItem = MenuItem.notifications;
          });
        },
      ),
    ];

    // Filter menu items based on user roles
    final menuItems = RbacService.instance.filterByRoles(
      items: allMenuItems,
      userRoles: userRoles,
      getAllowedRoles: (item) => item.allowedRoles,
    );

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ...menuItems.map((item) => _buildMenuItem(context, item)),
        const Divider(),
        _buildMenuItem(
          context,
          _MenuItem(
            icon: 'assets/icons/icon_exit.svg',
            title: 'Выход',
            allowedRoles: [], // No role restriction for logout
            onTap: () => _onLogout(context),
            isExit: true,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context, _MenuItem item) {
    final isMobile = Responsive.isMobile(context);
    final showTitle = isMobile || _isMenuExpanded;
    final isSelected =
        item.menuItem != null && _selectedMenuItem == item.menuItem;

    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: showTitle ? 16 : 25),
      leading: SvgPicture.asset(
        item.icon,
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(
          item.isExit
              ? AppColors.red
              : isSelected
              ? AppColors.primary
              : AppColors.grey,
          BlendMode.srcIn,
        ),
      ),
      title: showTitle
          ? Text(
              item.title,
              style: TextStyle(
                color: item.isExit
                    ? AppColors.red
                    : isSelected
                    ? AppColors.primary
                    : AppColors.black,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            )
          : null,
      selected: isSelected,
      selectedTileColor: AppColors.grey100,
      onTap: () {
        if (isMobile) {
          _closeDrawer();
        }
        item.onTap();
      },
      hoverColor: AppColors.grey100,
    );
  }

  Widget _buildContent(BuildContext context) {
    switch (_selectedMenuItem) {
      case MenuItem.avar:
        return const AvarView();
      case MenuItem.analytics:
        return _buildPlaceholder('Аналитика');
      case MenuItem.reports:
        return _buildPlaceholder('Отчеты');
      case MenuItem.accounting:
        return _buildPlaceholder('Бухгалтерия');
      case MenuItem.users:
        return _buildPlaceholder('Пользователи');
      case MenuItem.profile:
        return _buildPlaceholder('Профиль');
      case MenuItem.notifications:
        return _buildPlaceholder('Уведомления');
      case MenuItem.verification:
        return const VerificationView();
    }
  }

  Widget _buildPlaceholder(String title) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}

class _MenuItem {
  final String icon;
  final String title;
  final VoidCallback onTap;
  final bool isExit;
  final MenuItem? menuItem;
  final List<UserRole> allowedRoles;

  _MenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isExit = false,
    this.menuItem,
    this.allowedRoles = const [],
  });
}
