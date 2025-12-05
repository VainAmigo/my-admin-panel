import 'package:admin_panel/components/components.dart';
import 'package:admin_panel/config/config.dart';
import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({
    super.key,
    this.onFiltersSet,
    this.onFiltersReset,
    this.filtersList,
    this.filterButtonText,
    this.filterTitleText,
    this.isResetButtonVisible = true,
  });

  final void Function()? onFiltersSet;
  final void Function()? onFiltersReset;
  final List<Widget>? filtersList;
  final String? filterButtonText;
  final String? filterTitleText;

  final bool isResetButtonVisible;

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizing.spaceBtwSection),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey100),
      ),
      child: Column(
        spacing: AppSizing.spaceBtwSection,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(widget.filterTitleText ?? 'Фильтры', style: AppTypography.black20w400),
              const Spacer(),
              Row(
                spacing: 10,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PrimaryButton(
                    text: widget.filterButtonText ?? 'Сформировать',
                    onPressed: widget.onFiltersSet,
                  ),
                  if (widget.isResetButtonVisible) TextButton.icon(
                    onPressed: widget.onFiltersReset,
                    icon: Icon(Icons.refresh, size: 16, color: AppColors.grey),
                    label: Text(
                      'Сбросить',
                      style: TextStyle(fontSize: 12, color: AppColors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),

          Responsive.isDesktop(context)
              ? Row(
                  spacing: AppSizing.spaceBtwSection,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: widget.filtersList ?? [],
                )
              : Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: widget.filtersList ?? [],
                ),
        ],
      ),
    );
  }
}
