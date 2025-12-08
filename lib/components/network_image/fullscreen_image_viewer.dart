import 'package:admin_panel/config/config.dart';
import 'package:flutter/material.dart';

class FullscreenImageViewer extends StatelessWidget {
  const FullscreenImageViewer({super.key, required this.imageUrl, this.title});

  final String imageUrl;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: InteractiveViewer(
          child: Image.network(
            imageUrl,
            fit: Responsive.isMobile(context) ? BoxFit.contain : BoxFit.fitHeight,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                      : null,
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  static void show(BuildContext context, String imageUrl, {String? title}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            FullscreenImageViewer(imageUrl: imageUrl, title: title),
        fullscreenDialog: true,
      ),
    );
  }
}
