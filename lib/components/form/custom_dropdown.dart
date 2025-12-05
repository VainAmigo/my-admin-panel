import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  const CustomDropdown({
    super.key,
    this.value,
    this.items,
    this.onChanged,
    this.hintText,
    this.label,
    this.width,
    this.enabled = true,
    this.itemBuilder,
  });

  final T? value;
  final List<T>? items;
  final void Function(T?)? onChanged;
  final String? hintText;
  final String? label;
  final double? width;
  final bool enabled;
  final String Function(T)? itemBuilder;

  String _getItemLabel(T item) {
    if (itemBuilder != null) {
      return itemBuilder!(item);
    }
    return item.toString();
  }

  @override
  Widget build(BuildContext context) {
    final isEmpty = items == null || items!.isEmpty;
    final isDisabled = !enabled || isEmpty;

    return SizedBox(
      width: width,
      child: Padding(
        padding: EdgeInsets.only(top: label != null ? 16 : 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (label != null)
              Padding(
                padding: EdgeInsets.only(bottom: AppSizing.spaceBtwItm),
                child: Text(
                  label!,
                  style: AppTypography.grey14w500,
                ),
              ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppSizing.defaultRadius),
                border: Border.all(color: AppColors.grey),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: AppSizing.spaceBtwSection,
              ),
              child: DropdownButton<T>(
                value: value,
                isExpanded: true,
                underline: const SizedBox(),
                hint: Text(
                  isEmpty
                      ? hintText ?? 'Нет доступных вариантов'
                      : hintText ?? 'Выберите значение',
                  style: AppTypography.grey14w500,
                ),
                items: isEmpty
                    ? null
                    : items!.map((item) {
                        return DropdownMenuItem<T>(
                          value: item,
                          child: Text(
                            _getItemLabel(item),
                            style: AppTypography.black20w400,
                          ),
                        );
                      }).toList(),
                onChanged: isDisabled ? null : onChanged,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: isDisabled ? AppColors.grey : AppColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

