import 'package:admin_panel/components/network_image/fullscreen_image_viewer.dart';
import 'package:admin_panel/consts/consts.dart';
import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

class NetworkImageViewer extends StatelessWidget {
  const NetworkImageViewer({
    super.key,
    required this.imageUrl,
    this.label,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.showLabel = true,
  });

  /// URL изображения (может быть относительным или абсолютным)
  final String imageUrl;

  /// Подпись к изображению
  final String? label;

  /// Высота изображения
  final double? height;

  /// Ширина изображения
  final double? width;

  /// Способ масштабирования изображения
  final BoxFit fit;

  /// Показывать ли подпись
  final bool showLabel;

  @override
  Widget build(BuildContext context) {
    final fullImageUrl = imageUrl.startsWith('http')
        ? imageUrl
        : '${ApiConsts.baseUrl}$imageUrl';

    return Padding(
      padding: EdgeInsets.only(bottom: AppSizing.spaceBtwSection),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showLabel && label != null) ...[
            Text(
              label!,
              style: AppTypography.grey14w500,
            ),
            SizedBox(height: AppSizing.spaceBtwItm),
          ],
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => FullscreenImageViewer.show(
                context,
                fullImageUrl,
                title: label,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSizing.defaultRadius),
                child: Stack(
                  children: [
                    Image.network(
                      fullImageUrl,
                      width: width ?? double.infinity,
                      height: height,
                      fit: fit,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          height: height ?? 200,
                          width: width ?? double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.grey100,
                            borderRadius: BorderRadius.circular(AppSizing.defaultRadius),
                          ),
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: height ?? 200,
                          width: width ?? double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.grey100,
                            borderRadius: BorderRadius.circular(AppSizing.defaultRadius),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  color: AppColors.grey,
                                  size: 48,
                                ),
                                SizedBox(height: AppSizing.spaceBtwItm),
                                Text(
                                  'Ошибка загрузки изображения $imageUrl',
                                  style: AppTypography.grey14w500,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    // Иконка для указания, что изображение можно увеличить
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.fullscreen,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

