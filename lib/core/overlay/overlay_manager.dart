import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class OverlayIndicator extends StatelessWidget {
  const OverlayIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}

extension LoadingOverlayManager on BuildContext {
  void manageOverlay([bool isLoadingState = false]) {
    if (isLoadingState && !loaderOverlay.visible) {
      loaderOverlay.show();
    } else if (!isLoadingState && loaderOverlay.visible) {
      loaderOverlay.hide();
    }
  }

  void hideOverlayIfAvtive() {
    if (loaderOverlay.visible) {
      loaderOverlay.hide();
    }
  }
}
