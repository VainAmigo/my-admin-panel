import 'package:admin_panel/components/components.dart';
import 'package:admin_panel/config/config.dart';
import 'package:admin_panel/core/core.dart';
import 'package:admin_panel/modules/modules.dart';
import 'package:admin_panel/server/server.dart';
import 'package:flutter/material.dart';

class UsersTableWidget extends StatelessWidget {
  const UsersTableWidget({
    super.key,
    required this.data,
    required this.currentPage,
    required this.onPageChanged,
    required this.onCurrentPageReset,
    this.onAction,
  });

  final UsersSearchResponse data;
  final int currentPage;
  final ValueChanged<int> onPageChanged;
  final VoidCallback onCurrentPageReset;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    // Проверка на необходимость сброса текущей страницы
    if (data.pagination.pages > 0 && currentPage >= data.pagination.pages) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        onCurrentPageReset();
      });
    } else if (data.pagination.pages == 0 && currentPage > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        onCurrentPageReset();
      });
    }

    final columns = _buildColumns();

    final pagination = TablePagination(
      total: data.pagination.total,
      limit: data.pagination.limit,
      page: data.pagination.pages > 0 ? data.pagination.page : 1,
      pages: data.pagination.pages,
    );

    return CustomTable<UsersItem>(
      total: pagination.total,
      data: data.data,
      columns: columns,
      enableHorizontalScroll: true,
      pagination: pagination,
      minWidth: 1400,
      onPageChanged: onPageChanged,
      onTap: (index) {},
    );
  }

  List<TableColumn<UsersItem>> _buildColumns() {
    return [
      TableColumn<UsersItem>(
        title: 'ID',
        dataExtractor: (item) => item.userDto?.id?.toString() ?? '',
        width: TableConfig.idWidth,
      ),
      TableColumn<UsersItem>(
        title: 'ФИО',
        dataExtractor: (item) => item.personDto?.fullName ?? '',
      ),
      TableColumn<UsersItem>(
        title: 'Телефон',
        dataExtractor: (item) => item.userDto?.username ?? '',
        width: TableConfig.pinWidth,
      ),
      TableColumn<UsersItem>(
        title: 'Роли',
        dataExtractor: (item) => item.roles
                ?.map((role) => role.code ?? '')
                .join(', ') ??
            '',
        customBuilder: (item) {
          final roles = item.roles ?? [];
          return Wrap(
            spacing: 5,
            runSpacing: 5,
            children: roles.map((role) {
              final roleCode = role.code;
              if (roleCode == null || roleCode.isEmpty) {
                return const SizedBox.shrink();
              }
              return TextTag(
                text: UserRoleUtil.getRoleTextByCode(roleCode),
                textColor: UserRoleUtil.getRoleColorByCode(roleCode),
                color: UserRoleUtil.getRoleColorByCode(roleCode)
                    .withValues(alpha: 0.4),
              );
            }).toList(),
          );
        },
      ),
      TableColumn<UsersItem>(
        title: 'Действия',
        width: TableConfig.actionsWidth,
        dataExtractor: (item) => '',
        customBuilder: (item) => UsersActionsWidget(
          onEdit: () {},
          onDelete: () => onAction?.call(),
          onManageRoles: () {},
        )
      ),
    ];
  }
}

