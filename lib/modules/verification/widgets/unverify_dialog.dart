import 'package:admin_panel/components/components.dart';
import 'package:admin_panel/config/config.dart';
import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

class UnverifyDialog extends StatefulWidget {
  const UnverifyDialog({
    super.key,
    required this.userName,
    required this.onConfirm,
  });

  final String userName;
  final void Function(String reason, {String? description}) onConfirm;

  @override
  State<UnverifyDialog> createState() => _UnverifyDialogState();
}

class _UnverifyDialogState extends State<UnverifyDialog> {
  String? _selectedReason;
  final TextEditingController _otherReasonController = TextEditingController();

  @override
  void dispose() {
    _otherReasonController.dispose();
    super.dispose();
  }

  final List<Map<String, String>> _rejectionReasons = [
    {
      'id': 'poor_quality',
      'title': 'Некачественные фотографии',
      'description': 'Фотографии нечеткие или нечитаемые',
    },
    {
      'id': 'missing_documents',
      'title': 'Отсутствуют документы',
      'description': 'Не все необходимые документы предоставлены',
    },
    {
      'id': 'data_mismatch',
      'title': 'Несоответствие данных',
      'description': 'Данные в документах не совпадают',
    },
    {
      'id': 'other',
      'title': 'Другая причина',
      'description': 'Иная причина отказа в верификации',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizing.defaultRadius),
      ),
      backgroundColor: AppColors.white,
      title: Row(
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: AppColors.red,
            size: 28,
          ),
          SizedBox(width: AppSizing.spaceBtwItm),
          Expanded(
            child: Text(
              'Отмена верификации',
              style: AppTypography.black20w400,
            ),
          ),
        ],
      ),
      content: SizedBox(
        width: Responsive.isMobile(context)
            ? null
            : MediaQuery.of(context).size.width * 0.4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Выберите причину отказа в верификации для ${widget.userName}:',
              style: AppTypography.black16w400,
            ),
            SizedBox(height: AppSizing.spaceBtwSection),
            ..._rejectionReasons.map((reason) => _buildReasonCard(reason)),
            if (_selectedReason == 'other') ...[
              SizedBox(height: AppSizing.spaceBtwSection),
              CustomTextFormField(
                controller: _otherReasonController,
                label: 'Опишите причину отказа',
                maxLines: 2,
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ],
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Отмена',
                style: AppTypography.grey16w400,
              ),
            ),
            SizedBox(width: AppSizing.spaceBtwItm),
            PrimaryButton(
              text: 'Подтвердить',
              color: AppColors.red,
              foregroundColor: AppColors.white,
              onPressed: _canConfirm()
                  ? () {
                      final reason = _selectedReason!;
                      final description = _selectedReason == 'other'
                          ? _otherReasonController.text.trim()
                          : null;
                      widget.onConfirm(reason, description: description);
                    }
                  : null,
            ),
          ],
        ),
      ],
    );
  }

  bool _canConfirm() {
    if (_selectedReason == null) return false;
    if (_selectedReason == 'other') {
      return _otherReasonController.text.trim().isNotEmpty;
    }
    return true;
  }

  Widget _buildReasonCard(Map<String, String> reason) {
    final isSelected = _selectedReason == reason['id'];
    return Padding(
      padding: EdgeInsets.only(bottom: AppSizing.spaceBtwItm),
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedReason = reason['id'];
            if (reason['id'] != 'other') {
              _otherReasonController.clear();
            }
          });
        },
        borderRadius: BorderRadius.circular(AppSizing.defaultRadius),
        child: Container(
          padding: EdgeInsets.all(AppSizing.spaceBtwSection),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.red.withValues(alpha: 0.1)
                : AppColors.grey100,
            borderRadius: BorderRadius.circular(AppSizing.defaultRadius),
            border: Border.all(
              color: isSelected ? AppColors.red : AppColors.grey100,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? AppColors.red : AppColors.white,
                  border: Border.all(
                    color: isSelected ? AppColors.red : AppColors.grey,
                    width: 2,
                  ),
                ),
                child: isSelected
                    ? Icon(
                        Icons.check,
                        size: 16,
                        color: AppColors.white,
                      )
                    : null,
              ),
              SizedBox(width: AppSizing.spaceBtwItm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reason['title']!,
                      style: isSelected
                          ? AppTypography.black16w400.copyWith(
                              fontWeight: FontWeight.w600,
                            )
                          : AppTypography.black16w400,
                    ),
                    SizedBox(height: 4),
                    Text(
                      reason['description']!,
                      style: AppTypography.grey14w500.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

