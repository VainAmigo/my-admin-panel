import 'package:admin_panel/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class PlaceholderView extends StatelessWidget {
  const PlaceholderView({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
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

