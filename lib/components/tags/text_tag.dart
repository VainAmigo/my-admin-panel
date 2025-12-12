import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

class TextTag extends StatelessWidget {
  const TextTag({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    this.icon,
    this.isIconVisible = false,
  });

  final String text;
  final Color color;
  final Color textColor;
  final IconData? icon;
  final bool? isIconVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: color),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: isIconVisible!
          ? Icon(icon, color: textColor, size: 12)
          : Text(
              text,
              style: AppTypography.grey14w500.copyWith(
                color: textColor,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
    );
  }
}
