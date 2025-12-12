import 'package:admin_panel/components/components.dart';
import 'package:admin_panel/consts/consts.dart';
import 'package:admin_panel/server/server.dart';
import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

class VerificationPhotosCard extends StatelessWidget {
  const VerificationPhotosCard({super.key, required this.verification});

  final VerificationItem verification;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizing.spaceBtwSection),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizing.defaultRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Фотографии', style: AppTypography.black28w600),
          SizedBox(height: AppSizing.spaceBtwSection),
          ..._buildPhotos(),
        ],
      ),
    );
  }

  List<Widget> _buildPhotos() {
    final hasPhotos =
        verification.userDto?.selfieUrl?.isNotEmpty ??
        false ||
            (verification.userDto?.passportFrontUrl?.isNotEmpty ?? false) ||
            (verification.userDto?.passportBackUrl?.isNotEmpty ?? false);

    if (!hasPhotos) {
      return [
        Center(
          child: Padding(
            padding: EdgeInsets.all(AppSizing.spaceBtwSection),
            child: Text(
              'Фотографии отсутствуют',
              style: AppTypography.grey14w500,
            ),
          ),
        ),
      ];
    }

    return [
      NetworkImageViewer(
        height: 250,
        fit: BoxFit.cover,
        label: 'Селфи',
        imageUrl:
            '${ApiConsts.urlForImages}${verification.userDto?.selfieUrl ?? ''}',
      ),

      NetworkImageViewer(
        height: 250,
        fit: BoxFit.cover,
        label: 'Паспорт (лицевая сторона)',
        imageUrl:
            '${ApiConsts.urlForImages}${verification.userDto?.passportFrontUrl ?? ''}',
      ),

      NetworkImageViewer(
        height: 250,
        fit: BoxFit.cover,
        label: 'Паспорт (обратная сторона)',
        imageUrl:
            '${ApiConsts.urlForImages}${verification.userDto?.passportBackUrl ?? ''}',
      ),
    ];
  }
}
