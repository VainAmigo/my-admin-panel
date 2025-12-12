import 'package:admin_panel/components/components.dart';
import 'package:admin_panel/config/config.dart';
import 'package:admin_panel/core/core.dart';
import 'package:admin_panel/modules/modules.dart';
import 'package:admin_panel/server/server.dart';
import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnverifiedTabView extends StatefulWidget {
  const UnverifiedTabView({super.key});

  @override
  State<UnverifiedTabView> createState() => _UnverifiedTabViewState();
}

class _UnverifiedTabViewState extends State<UnverifiedTabView> {
  int _currentPage = 0; 
  final int _limit = 10;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && !_isInitialized) {
        _isInitialized = true;
        _loadVerifications();
      }
    });
  }

  void _loadVerifications() {
    context.read<VerificationCubit>().getVerificationList(
      verificationStatus: VerificationStatus.pending,
      page: _currentPage,
      limit: _limit,
    );
  }

  void _onPageChanged(int page) {
    // CustomTable передает страницы начиная с 1, конвертируем в формат API (начиная с 0)
    setState(() {
      _currentPage = page - 1;
    });
    _loadVerifications();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationCubit, VerificationState>(
      builder: (context, state) {
        switch (state) {
          case VerificationLoading():
            return const CenteredIndicator();
          case VerificationInitial():
            return const SizedBox.shrink();
          case VerificationLoaded():
            return _buildTable(state.data);
          case VerificationError():
            return Center(
              child: Text(
                'Ошибка: ${state.error}',
                style: AppTypography.grey16w400,
              ),
            );
        }
      },
    );
  }

  Widget _buildTable(VerificationListResponse data) {
    // Если текущая страница больше доступных страниц или нет данных, сбрасываем на первую страницу
    // _currentPage - 0-based, data.pagination.pages - 1-based (общее количество страниц)
    if (data.pagination.pages > 0 && _currentPage >= data.pagination.pages) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _currentPage = 0;
          });
          _loadVerifications();
        }
      });
    } else if (data.pagination.pages == 0 && _currentPage > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _currentPage = 0;
          });
        }
      });
    }

    final columns = [
      TableColumn<VerificationItem>(
        title: 'ID',
        dataExtractor: (item) => item.userDto?.id?.toString() ?? '',
        width: TableConfig.idWidth,
      ),
      TableColumn<VerificationItem>(
        title: 'Имя',
        dataExtractor: (item) => item.personDto?.fullName ?? '',
      ),
      TableColumn<VerificationItem>(
        title: 'Телефон',
        dataExtractor: (item) => item.userDto?.username ?? '',
      ),
      TableColumn<VerificationItem>(
        title: 'Статус',
        dataExtractor: (item) => item.userDto?.verificationStatus?.name ?? '',
        customBuilder: (item) => TextTag(
          text: VerificationStatusUtil.getStatusText(item.userDto?.verificationStatus),
          textColor: VerificationStatusUtil.getStatusColor(item.userDto?.verificationStatus),
          color: VerificationStatusUtil.getStatusColor(item.userDto?.verificationStatus).withAlpha(40),
        ),
      ),
    ];

    // API возвращает страницы начиная с 1, используем напрямую
    // Если pages == 0, то page должен быть 1 для корректного отображения (хотя пагинация не будет показана)
    final pagination = TablePagination(
      total: data.pagination.total,
      limit: data.pagination.limit,
      page: data.pagination.pages > 0 ? data.pagination.page : 1,
      pages: data.pagination.pages,
    );

    return CustomTable<VerificationItem>(
      total: pagination.total,
      data: data.data,
      columns: columns,
      enableHorizontalScroll: true,
      pagination: pagination,
      minWidth: 1100,
      onPageChanged: _onPageChanged,
      onTap: (index) {
        final item = data.data[index];
        Navigator.pushNamed(
          context,
          AppRouter.verificationDetail,
          arguments: item,
        );
      },
    );
  }
}
