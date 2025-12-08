import 'package:admin_panel/modules/main/widgets/menu_items_list.dart';
import 'package:admin_panel/modules/main/widgets/menu_item_model.dart';
import 'package:admin_panel/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class DesktopSideMenu extends StatelessWidget {
  const DesktopSideMenu({
    super.key,
    required this.isMenuExpanded,
    required this.selectedMenuItem,
    required this.onToggleMenu,
    required this.onMenuItemSelected,
    required this.onLogout,
  });

  final bool isMenuExpanded;
  final MenuItem selectedMenuItem;
  final VoidCallback onToggleMenu;
  final ValueChanged<MenuItem> onMenuItemSelected;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    final menuWidth = isMenuExpanded ? 250.0 : 80.0;

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
                if (isMenuExpanded)
                  Image.asset('assets/images/ayu_logo.png')
                else
                  const SizedBox.shrink(),
                IconButton(
                  icon: Icon(
                    isMenuExpanded ? Icons.chevron_left : Icons.chevron_right,
                    color: AppColors.white,
                  ),
                  onPressed: onToggleMenu,
                ),
              ],
            ),
          ),
          Expanded(
            child: MenuItemsList(
              selectedMenuItem: selectedMenuItem,
              isMenuExpanded: isMenuExpanded,
              onMenuItemSelected: onMenuItemSelected,
              onLogout: onLogout,
              onCloseDrawer: null,
            ),
          ),
        ],
      ),
    );
  }
}

