import 'package:admin_panel/components/components.dart';
import 'package:admin_panel/config/config.dart';
import 'package:admin_panel/core/core.dart';
import 'package:admin_panel/server/server.dart';
import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

class AvarRegisterTableWidget extends StatelessWidget {
  const AvarRegisterTableWidget({super.key, required this.data});

  final AvarPolicySearchResponse data;

  @override
  Widget build(BuildContext context) {
    final columns = [
      TableColumn<AvarPolicySearchResponse>(
        title: '',
        dataExtractor: (item) => '',
        width: TableConfig.idWidth,
        customBuilder: (item) => Dot(color: AppColors.primary25),
      ),
      TableColumn<AvarPolicySearchResponse>(
        title: 'номер полиса',
        dataExtractor: (item) => item.policyNumber,
        width: TableConfig.policyNumberWidth,
      ),
      TableColumn<AvarPolicySearchResponse>(
        title: 'период действия',
        dataExtractor: (item) =>
            '${item.validFrom.formatted} - ${item.validTo.formatted}',
        width: TableConfig.periodWidth,
      ),
      TableColumn<AvarPolicySearchResponse>(
        title: 'владелец',
        width: TableConfig.nameWidth,
        dataExtractor: (item) => item.personFullName,
      ),
      TableColumn<AvarPolicySearchResponse>(
        title: 'пин владельца',
        dataExtractor: (item) => item.personIin,
        width: TableConfig.pinWidth,
      ),
      TableColumn<AvarPolicySearchResponse>(
        title: 'гос.номер',
        dataExtractor: (item) => item.vehicleNumber,
        width: TableConfig.carNumberWidth,
      ),
      TableColumn<AvarPolicySearchResponse>(
        title: 'автомобиль',
        dataExtractor: (item) => '${item.brand} ${item.model}',
        width: TableConfig.carWidth,
      ),
      TableColumn<AvarPolicySearchResponse>(
        title: 'статус',
        dataExtractor: (item) => item.status.name,
        width: TableConfig.statusWidth,
        customBuilder: (item) => TextTag(
          text: item.status.name,
          textColor: item.isActive ? AppColors.green : AppColors.red,
          color: item.isActive
              ? AppColors.green.withAlpha(40)
              : AppColors.red.withAlpha(30),
        ),
      ),
    ];
    return CustomTable(
      data: [data],
      columns: columns,
      enableHorizontalScroll: true,
      minWidth: 1450,
      onTap: (index) {
        Navigator.pushNamed(
          context,
          AppRouter.avarRegisterDetail,
          arguments: data,
        );
      },
    );
  }
}
