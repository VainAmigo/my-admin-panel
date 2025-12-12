import 'package:admin_panel/core/core.dart';
import 'package:admin_panel/modules/main/widgets/menu_item_model.dart';
import 'package:admin_panel/modules/main/widgets/menu_item_widget.dart';
import 'package:admin_panel/modules/modules.dart';
import 'package:admin_panel/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuItemsList extends StatelessWidget {
  const MenuItemsList({
    super.key,
    required this.selectedMenuItem,
    required this.isMenuExpanded,
    required this.onMenuItemSelected,
    required this.onLogout,
    required this.onCloseDrawer,
  });

  final MenuItem selectedMenuItem;
  final bool isMenuExpanded;
  final ValueChanged<MenuItem> onMenuItemSelected;
  final VoidCallback onLogout;
  final VoidCallback? onCloseDrawer;

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    final List<UserRole> userRoles;

    if (authState is AuthAuthenticated) {
      userRoles = UserRole.fromStringList(authState.authResponse.roles);
    } else {
      userRoles = [];
    }

    final allMenuItems = _buildAllMenuItems();

    // Filter menu items based on user roles
    final menuItems = RbacService.instance.filterByRoles(
      items: allMenuItems,
      userRoles: userRoles,
      getAllowedRoles: (item) => item.allowedRoles,
    );

    final isMobile = Responsive.isMobile(context);
    final showTitle = isMobile || isMenuExpanded;

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ...menuItems.map(
          (item) => MenuItemWidget(
            item: item,
            isSelected:
                item.menuItem != null && selectedMenuItem == item.menuItem,
            showTitle: showTitle,
            onCloseDrawer: onCloseDrawer,
          ),
        ),
        const Divider(),
        MenuItemWidget(
          item: MenuItemModel(
            icon: 'assets/icons/icon_exit.svg',
            title: 'Выход',
            allowedRoles: [],
            onTap: onLogout,
            isExit: true,
          ),
          isSelected: false,
          showTitle: showTitle,
          onCloseDrawer: onCloseDrawer,
        ),
      ],
    );
  }

  List<MenuItemModel> _buildAllMenuItems() {
    return [
      MenuItemModel(
        icon: 'assets/icons/icon_analytics.svg',
        title: 'Аналитика',
        menuItem: MenuItem.analytics,
        allowedRoles: [UserRole.admin],
        onTap: () => onMenuItemSelected(MenuItem.analytics),
      ),
      MenuItemModel(
        icon: 'assets/icons/icon_reports.svg',
        title: 'Отчеты',
        menuItem: MenuItem.reports,
        allowedRoles: [UserRole.admin],
        onTap: () => onMenuItemSelected(MenuItem.reports),
      ),
      MenuItemModel(
        icon: 'assets/icons/icon_accounting.svg',
        title: 'Бухгалтерия',
        menuItem: MenuItem.accounting,
        allowedRoles: [UserRole.admin],
        onTap: () => onMenuItemSelected(MenuItem.accounting),
      ),
      MenuItemModel(
        icon: 'assets/icons/icon_avar.svg',
        title: 'Аварийные комиссар',
        menuItem: MenuItem.avar,
        allowedRoles: [UserRole.admin, UserRole.avar],
        onTap: () => onMenuItemSelected(MenuItem.avar),
      ),
      MenuItemModel(
        icon: 'assets/icons/icon_verification.svg',
        title: 'Верификация',
        menuItem: MenuItem.verification,
        allowedRoles: [UserRole.admin],
        onTap: () => onMenuItemSelected(MenuItem.verification),
      ),
      MenuItemModel(
        icon: 'assets/icons/icon_persons.svg',
        title: 'Пользователи',
        menuItem: MenuItem.users,
        allowedRoles: [UserRole.admin],
        onTap: () => onMenuItemSelected(MenuItem.users),
      ),
      MenuItemModel(
        icon: 'assets/icons/icon_person.svg',
        title: 'Профиль',
        menuItem: MenuItem.profile,
        allowedRoles: [UserRole.admin],
        onTap: () => onMenuItemSelected(MenuItem.profile),
      ),
      MenuItemModel(
        icon: 'assets/icons/icon_notification.svg',
        title: 'Уведомления',
        menuItem: MenuItem.notifications,
        allowedRoles: [UserRole.admin],
        onTap: () => onMenuItemSelected(MenuItem.notifications),
      ),
    ];
  }
}
