import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

class CenteredIndicator extends StatelessWidget {
  const CenteredIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}

class CenteredIndicatorProgress extends StatelessWidget {
  const CenteredIndicatorProgress(
    this.progress, {
    this.size = 50,
    super.key,
  });

  final double progress;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: Center(
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  width: size,
                  height: size,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 3,
                  ),
                ),
              ),
              Center(
                child: Text(
                  '${(progress * 100).toInt()}%',
                  style: AppTypography.grey14w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
