import 'package:admin_panel/components/components.dart';
import 'package:admin_panel/config/config.dart';
import 'package:admin_panel/core/core.dart';
import 'package:admin_panel/server/server.dart';
import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

class AvarDraftedTableWidget extends StatelessWidget {
  const AvarDraftedTableWidget({
    super.key,
    required this.data,
    this.onPageChanged,
  });

  final AvarFilteredSearchResponse data;
  final Function(int page)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    final columns = [
      TableColumn<AvarPolicy>(
        title: '',
        dataExtractor: (item) => '',
        width: TableConfig.idWidth,
        customBuilder: (item) => Dot(color: AppColors.primary25),
      ),
      TableColumn<AvarPolicy>(
        title: 'номер РЗНУ',
        dataExtractor: (item) => item.caseNumber ?? '',
        width: TableConfig.policyNumberWidth,
      ),
      TableColumn<AvarPolicy>(
        title: 'номер полиса',
        dataExtractor: (item) => item.policyNumber ?? '',
        width: TableConfig.policyNumberWidth,
      ),
      TableColumn<AvarPolicy>(
        title: 'дата аварии',
        dataExtractor: (item) => item.dateOfAccident?.formatted ?? '',
        width: TableConfig.periodWidth,
      ),
      TableColumn<AvarPolicy>(
        title: 'дата выплаты',
        dataExtractor: (item) => item.dateOfPayout?.formatted ?? '',
        width: TableConfig.periodWidth,
      ),
      TableColumn<AvarPolicy>(
        title: 'владелец',
        width: TableConfig.nameWidth,
        dataExtractor: (item) => item.fullNameOrOrg ?? '',
      ),
      TableColumn<AvarPolicy>(
        title: 'идентификатор',
        dataExtractor: (item) => item.identifier ?? '',
        width: TableConfig.pinWidth,
      ),
      TableColumn<AvarPolicy>(
        title: 'гос.номер',
        dataExtractor: (item) => item.vehicleNumber ?? '',
        width: TableConfig.carNumberWidth,
      ),
      TableColumn<AvarPolicy>(
        title: 'виновник',
        dataExtractor: (item) => item.causer ?? '',
        width: TableConfig.carWidth,
      ),
      TableColumn<AvarPolicy>(
        title: 'статус',
        dataExtractor: (item) => item.status ?? '',
        width: TableConfig.statusWidth,
        customBuilder: (item) => TextTag(
          text: item.status ?? '',
          textColor: AppColors.green,
          color: AppColors.green.withAlpha(40),
        ),
      ),
    ];

    // Если pages == 0, то page должен быть 1 для корректного отображения (хотя пагинация не будет показана)
    final pagination = TablePagination(
      total: data.pagination.total,
      limit: data.pagination.limit,
      page: data.pagination.pages > 0 ? data.pagination.page : 1,
      pages: data.pagination.pages,
    );

    return CustomTable<AvarPolicy>(
      data: data.policies,
      columns: columns,
      enableHorizontalScroll: true,
      minWidth: 1450,
      pagination: pagination,
      onPageChanged: onPageChanged,
      onTap: (index) {
        final policy = data.policies[index];
        Navigator.pushNamed(
          context,
          AppRouter.avarRegisterDetail,
          arguments: policy,
        );
      },
    );
  }
}
