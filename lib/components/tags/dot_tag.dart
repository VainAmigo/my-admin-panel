import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  const Dot({super.key, required this.color, this.size = 20});

  final Color color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      height: size ?? 20,
      width: size ?? 20,
    );
  }
}