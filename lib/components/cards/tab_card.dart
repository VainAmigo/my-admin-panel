import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

class TabCard extends StatelessWidget {
  const TabCard({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  final String title;
  final bool isActive;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(AppSizing.spaceBtwSection),
        child: Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: isActive
              ? AppTypography.black20w400.copyWith(color: AppColors.white)
              : AppTypography.black20w400.copyWith(color: AppColors.grey),
        ),
      ),
    );
  }
}
