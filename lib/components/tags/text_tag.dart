import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

class TextTag extends StatelessWidget {
  const TextTag({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    this.onTap,
    this.icon,
    this.isIconVisible = false,
  });

  final String text;
  final Color color;
  final Color textColor;
  final void Function()? onTap;
  final Widget? icon;
  final bool? isIconVisible;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isIconVisible! && icon != null) Padding(
              padding: const EdgeInsets.only(right: 10),
              child: icon!,
            ),

            Text(
              textAlign: TextAlign.center,
              text,
              style: AppTypography.grey14w500.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
