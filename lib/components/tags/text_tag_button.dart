import 'package:flutter/material.dart';

class TagTextButton extends StatelessWidget {
  const TagTextButton({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onPressed,
  });

  final String text;
  final Color color;
  final Color textColor;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: color.withAlpha(30),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: color, width: 1),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
