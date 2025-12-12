import 'package:admin_panel/components/components.dart';
import 'package:admin_panel/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvarDraftedView extends StatefulWidget {
  const AvarDraftedView({super.key});

  @override
  State<AvarDraftedView> createState() => _AvarDraftedViewState();
}

class _AvarDraftedViewState extends State<AvarDraftedView> {
  late final TextEditingController _policyNumberController;
  late final TextEditingController _caseNumberController;
  DateTime? _selectedDate;
  int _currentPage = 1;
  final int _limit = 10;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Filter(
          filterTitleText: 'Поиск',
          filterButtonText: 'Искать',
          isResetButtonVisible: false,
          onFiltersSet: () => _onFiltersSet(),
          filtersList: _buildFilterWidgets(),
        ),
        BlocBuilder<AvarFilterCubit, AvarFilterState>(
          builder: (context, state) {
            switch (state) {
              case AvarFilterLoading():
                return const CenteredIndicator();
              case AvarFilterInitial():
                return const SizedBox.shrink();
              case AvarFilterLoaded():
                // Если текущая страница больше доступных страниц или нет данных, сбрасываем на первую страницу
                if (state.data.pagination.pages > 0 && _currentPage > state.data.pagination.pages) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (mounted) {
                      setState(() {
                        _currentPage = 1;
                      });
                      _onFiltersSet();
                    }
                  });
                } else if (state.data.pagination.pages == 0 && _currentPage > 1) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (mounted) {
                      setState(() {
                        _currentPage = 1;
                      });
                    }
                  });
                }
                return AvarDraftedTableWidget(
                  data: state.data,
                  onPageChanged: _onPageChanged,
                );
              case AvarFilterError():
                return Text(state.error);
            }
          },
        ),
      ],
    );
  }

  void _onFiltersSet() {
    setState(() {
      _currentPage = 1;
    });
    context.read<AvarFilterCubit>().getAvarFilteredSearch(
      page: _currentPage - 1, // Конвертируем из 1-based (UI) в 0-based (API запрос)
      limit: _limit,
      policyNumber: _policyNumberController.text.trim().isEmpty
          ? null
          : _policyNumberController.text.trim(),
      caseNumber: _caseNumberController.text.trim().isEmpty
          ? null
          : _caseNumberController.text.trim(),
      dateOfAccident: _selectedDate,
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
    context.read<AvarFilterCubit>().getAvarFilteredSearch(
      page: page - 1, // Конвертируем из 1-based (UI) в 0-based (API запрос)
      limit: _limit,
      policyNumber: _policyNumberController.text.trim().isEmpty
          ? null
          : _policyNumberController.text.trim(),
      caseNumber: _caseNumberController.text.trim().isEmpty
          ? null
          : _caseNumberController.text.trim(),
      dateOfAccident: _selectedDate,
    );
  }

  List<Widget> _buildFilterWidgets() {
    return [
      CustomSearchBar(
        controller: _policyNumberController,
        hintText: 'Поиск по номеру полиса',
        onSubmitted: (value) => _onFiltersSet(),
      ),
      CustomSearchBar(
        controller: _caseNumberController,
        hintText: 'Поиск по номеру РЗНУ',
        onSubmitted: (value) => _onFiltersSet(),
      ),
      CustomDatePicker(
        selectedDate: _selectedDate,
        hintText: 'Выберите дату аварии',
        onDateChanged: (value) => setState(() => _selectedDate = value),
      ),
    ];
  }

  @override
  void initState() {
    _policyNumberController = TextEditingController();
    _caseNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _policyNumberController.dispose();
    _caseNumberController.dispose();
    super.dispose();
  }
}
