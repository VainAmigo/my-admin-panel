import 'package:admin_panel/components/components.dart';
import 'package:admin_panel/config/config.dart';
import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  const DetailView({
    super.key,
    required this.appBarTitle,
    this.infoTitle = 'Информация о полисе',
    this.editableTitle = 'Данные об аварии',
    required this.infoRows,
    this.editableFields,
    this.child,
  });

  final String appBarTitle;
  final String infoTitle;
  final String editableTitle;
  final List<DetailInfoRow> infoRows;
  final List<Widget>? editableFields;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.grey100,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          appBarTitle,
          style: AppTypography.black20w400,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizing.spaceBtwSection),
        child: Center(
          child: SizedBox(
            width: Responsive.isMobile(context) ? double.infinity : width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (infoRows.isNotEmpty)
                  _buildInfoCard(
                    title: infoTitle,
                    children: _buildInfoRows(infoRows),
                  ),
                if (infoRows.isNotEmpty && editableFields != null && editableFields!.isNotEmpty)
                  SizedBox(height: AppSizing.spaceBtwSection),
                if (editableFields != null && editableFields!.isNotEmpty)
                  _buildEditableCard(
                    title: editableTitle,
                    children: editableFields!,
                  ),
                child ?? const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSizing.spaceBtwSection),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizing.defaultRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTypography.black28w600,
          ),
          SizedBox(height: AppSizing.spaceBtwSection),
          ...children,
        ],
      ),
    );
  }

  List<Widget> _buildInfoRows(List<DetailInfoRow> rows) {
    return rows.map((row) => _buildInfoRow(row)).toList();
  }

  Widget _buildEditableCard({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSizing.spaceBtwSection),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizing.defaultRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTypography.black28w600,
          ),
          SizedBox(height: AppSizing.spaceBtwSection),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoRow(DetailInfoRow row) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSizing.spaceBtwItm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSizing.spaceBtwItm,
        children: [
          Text(
            row.label,
            style: AppTypography.grey14w500,
          ),
          Expanded(
            child: Text(
              textAlign: TextAlign.end,
              row.value,
              style: AppTypography.black16w400,
            ),
          ),
        ],
      ),
    );
  }
}

