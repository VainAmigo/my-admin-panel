import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
    this.selectedDate,
    this.onDateChanged,
    this.initialDate,
    this.dateFormat,
    this.showClearIcon = true,
    this.firstDate,
    this.lastDate,
    this.height = 40,
    this.hintText,
  });

  final DateTime? selectedDate;
  final void Function(DateTime?)? onDateChanged;
  final DateTime? initialDate;
  final String? dateFormat;
  final bool showClearIcon;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final double? height;
  final String? hintText;

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? selectedDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime(2100),
      builder: (context, child) {
        return Localizations.override(context: context, child: child!);
      },
    );

    if (picked != null && picked != selectedDate) {
      onDateChanged?.call(picked);
    }
  }

  void _clearDate() {
    if (selectedDate != null) {
      onDateChanged?.call(null);
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat(dateFormat ?? 'dd.MM.yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppSizing.defaultRadius),
      onTap: () => _selectDate(context),
      child: Container(
        height: height,
        padding: EdgeInsets.symmetric(horizontal: AppSizing.spaceBtwSection),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizing.defaultRadius),
          border: Border.all(color: AppColors.grey),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: AppSizing.spaceBtwItm,
          children: [
            const Icon(Icons.calendar_today, size: 18, color: AppColors.grey),

            Text(
              selectedDate != null
                  ? _formatDate(selectedDate)
                  : hintText ?? 'Выберите дату',
              style: AppTypography.grey14w500,
            ),

            if (showClearIcon && selectedDate != null)
              InkWell(
                onTap: _clearDate,
                child: const Icon(
                  Icons.clear,
                  size: 20,
                  color: AppColors.black,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
