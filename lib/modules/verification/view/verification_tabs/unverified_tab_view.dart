import 'package:admin_panel/components/components.dart';
import 'package:admin_panel/config/config.dart';
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
  int _currentPage = 1;
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
      isVerified: true,
      page: _currentPage,
      limit: _limit,
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
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

  Widget _buildTable(VarificationListResponse data) {
    final columns = [
      TableColumn<VerificationItem>(
        title: 'ID',
        dataExtractor: (item) => item.id.toString(),
        width: TableConfig.idWidth,
      ),
      TableColumn<VerificationItem>(
        title: 'Имя',
        dataExtractor: (item) => item.name,
      ),
      TableColumn<VerificationItem>(
        title: 'Email',
        dataExtractor: (item) => item.email,
      ),
      TableColumn<VerificationItem>(
        title: 'Телефон',
        dataExtractor: (item) => item.phone,
      ),
      TableColumn<VerificationItem>(
        title: 'Статус',
        dataExtractor: (item) => item.status,
        customBuilder: (item) => TextTag(
          text: item.status == 'verified'
              ? 'Верифицирован'
              : 'Не верифицирован',
          textColor: item.status == 'verified'
              ? AppColors.green
              : AppColors.oragne,
          color: item.status == 'verified'
              ? AppColors.green.withAlpha(40)
              : AppColors.oragne.withAlpha(40),
        ),
      ),
    ];

    final pagination = TablePagination(
      total: data.pagination.total,
      limit: data.pagination.limit,
      page: data.pagination.page,
      pages: data.pagination.pages,
    );

    return CustomTable<VerificationItem>(
      total: pagination.total,
      data: data.verificationsList,
      columns: columns,
      enableHorizontalScroll: true,
      pagination: pagination,
      minWidth: 1100,
      onPageChanged: _onPageChanged,
      onTap: (index) {
        final item = data.verificationsList[index];
        Navigator.pushNamed(
          context,
          AppRouter.verificationDetail,
          arguments: item,
        );
      },
    );
  }
}
