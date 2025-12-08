import 'package:admin_panel/components/components.dart';
import 'package:admin_panel/server/server.dart';
import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

class VerificationInfoCard extends StatelessWidget {
  const VerificationInfoCard({
    super.key,
    required this.verification,
    required this.onUnverify,
    required this.onVerify,
  });

  final VerificationItem verification;
  final VoidCallback onUnverify;
  final VoidCallback onVerify;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSizing.spaceBtwSection,
      children: [
        Container(
          padding: EdgeInsets.all(AppSizing.spaceBtwSection),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppSizing.defaultRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Информация о верификации',
                style: AppTypography.black28w600,
              ),
              SizedBox(height: AppSizing.spaceBtwSection),
              _VerificationInfoRow(
                label: 'ID',
                value: verification.id.toString(),
              ),
              _VerificationInfoRow(
                label: 'Имя',
                value: verification.name,
              ),
              _VerificationInfoRow(
                label: 'Email',
                value: verification.email,
              ),
              _VerificationInfoRow(
                label: 'Телефон',
                value: verification.phone,
              ),
              _VerificationInfoRow(
                label: 'Статус',
                value: verification.status,
              ),
            ],
          ),
        ),
        Row(
          spacing: AppSizing.spaceBtwSection,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            PrimaryButton(
              color: AppColors.red,
              foregroundColor: AppColors.white,
              text: 'Не верифицирован',
              onPressed: onUnverify,
            ),
            PrimaryButton(
              text: 'Верифицировать',
              onPressed: onVerify,
            ),
          ],
        ),
      ],
    );
  }
}

class _VerificationInfoRow extends StatelessWidget {
  const _VerificationInfoRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSizing.spaceBtwItm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSizing.spaceBtwItm,
        children: [
          Text(label, style: AppTypography.grey14w500),
          Expanded(
            child: Text(
              textAlign: TextAlign.end,
              value,
              style: AppTypography.black16w400,
            ),
          ),
        ],
      ),
    );
  }
}

