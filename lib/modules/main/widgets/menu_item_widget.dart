import 'package:admin_panel/modules/main/widgets/menu_item_model.dart';
import 'package:admin_panel/themes/colors/app_colors.dart';
import 'package:admin_panel/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    super.key,
    required this.item,
    required this.isSelected,
    required this.showTitle,
    required this.onCloseDrawer,
  });

  final MenuItemModel item;
  final bool isSelected;
  final bool showTitle;
  final VoidCallback? onCloseDrawer;

  @override
  Widget build(BuildContext context) {
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
        if (Responsive.isMobile(context) && onCloseDrawer != null) {
          onCloseDrawer!();
        }
        item.onTap();
      },
      hoverColor: AppColors.grey100,
    );
  }
}

