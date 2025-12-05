import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

class EmtyContainer extends StatelessWidget {
  const EmtyContainer({super.key, this.title, this.description, this.icon});

  final String? title;
  final String? description;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        spacing: AppSizing.spaceBtwSection,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon ?? Icons.info, size: 48, color: AppColors.grey),
          Text(title ?? 'Нет данных для отображения', style: AppTypography.black32w600),
          Text(description ?? '', style: AppTypography.grey16w400),
        ],
      ),
    );
  }
}
