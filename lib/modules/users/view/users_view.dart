import 'package:admin_panel/components/components.dart';
import 'package:admin_panel/config/config.dart';
import 'package:admin_panel/modules/modules.dart';
import 'package:admin_panel/server/server.dart';
import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _idController;
  String? _selectedRole;

  int _currentPage = 0; 
  final int _limit = 10;

  @override
  void initState() {
    _idController = TextEditingController();
    _phoneNumberController = TextEditingController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadUsersWithEmptyRequest();
    });
  }

  @override
  void dispose() {
    _idController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizing.spaceBtwSection,
              vertical: Responsive.isMobile(context)
                  ? AppSizing.spaceBtwSection
                  : AppSizing.space50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UsersFiltersWidget(
                  phoneNumberController: _phoneNumberController,
                  idController: _idController,
                  selectedRole: _selectedRole,
                  onRoleChanged: (value) {
                    setState(() {
                      _selectedRole = value;
                    });
                  },
                  onSearch: _onSearch,
                  onResetFilters: _onResetFilters,
                ),
                SizedBox(height: AppSizing.spaceBtwSection),
                BlocBuilder<UsersCubit, UsersState>(
                  builder: (context, state) {
                    switch (state) {
                      case UsersInitial():
                        return const SizedBox.shrink();
                      case UsersLoading():
                        return const CenteredIndicator();
                      case UsersLoaded():
                        return UsersTableWidget(
                          data: state.data,
                          currentPage: _currentPage,
                          onPageChanged: _onPageChanged,
                          onCurrentPageReset: () {
                            setState(() {
                              _currentPage = 0;
                            });
                            _loadUsersWithEmptyRequest();
                          },
                          onAction: () => _onSearch(),
                        );
                      case UsersError():
                        return Center(child: Text(state.error));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Сброс всех фильтров
  void _onResetFilters() {
    _idController.clear();
    _phoneNumberController.clear();
    _selectedRole = null;

    setState(() {
      _currentPage = 0;
    });
    _loadUsersWithEmptyRequest();
  }

  /// Загрузка пользователей с пустым запросом
  void _loadUsersWithEmptyRequest() {
    final request = UsersSearchRequest();
    context.read<UsersCubit>().getUsersSearch(
      request: request,
      page: _currentPage,
      limit: _limit,
    );
  }

  /// Поиск пользователей по фильтрам
  void _onSearch() {
    setState(() {
      _currentPage = 0;
    });

    final request = UsersSearchRequest(
      userId: _idController.text.isNotEmpty
          ? int.tryParse(_idController.text)
          : null,
      username: _phoneNumberController.text.isNotEmpty
          ? _phoneNumberController.text
          : null,
      role: _selectedRole,
    );

    context.read<UsersCubit>().getUsersSearch(
      request: request,
      page: _currentPage,
      limit: _limit,
    );
  }

  /// Обработчик изменения страницы пагинации
  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page - 1;
    });
    
    final request = UsersSearchRequest(
      userId: _idController.text.isNotEmpty
          ? int.tryParse(_idController.text)
          : null,
      role: _selectedRole,
      username: _phoneNumberController.text.isNotEmpty
          ? _phoneNumberController.text
          : null,
    );
    
    context.read<UsersCubit>().getUsersSearch(
      request: request,
      page: _currentPage,
      limit: _limit,
    );
  }
}
