import 'package:admin_panel/modules/main/widgets/menu_items_list.dart';
import 'package:admin_panel/modules/main/widgets/menu_item_model.dart';
import 'package:admin_panel/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({
    super.key,
    required this.selectedMenuItem,
    required this.onMenuItemSelected,
    required this.onLogout,
    required this.onCloseDrawer,
  });

  final MenuItem selectedMenuItem;
  final ValueChanged<MenuItem> onMenuItemSelected;
  final VoidCallback onLogout;
  final VoidCallback onCloseDrawer;

  @override
  Widget build(BuildContext context) {
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
                  onPressed: onCloseDrawer,
                ),
              ],
            ),
          ),
          Expanded(
            child: MenuItemsList(
              selectedMenuItem: selectedMenuItem,
              isMenuExpanded: true,
              onMenuItemSelected: onMenuItemSelected,
              onLogout: onLogout,
              onCloseDrawer: onCloseDrawer,
            ),
          ),
        ],
      ),
    );
  }
}

