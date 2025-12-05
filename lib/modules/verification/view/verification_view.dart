import 'package:admin_panel/components/components.dart';
import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizing.spaceBtwSection,
            vertical: AppSizing.space50,
          ),
          child: Column(
            children: [
              Filter(
                filterTitleText: 'Фильтры',
                filterButtonText: 'Поиск',
                filtersList: _buildFilters(),
                onFiltersSet: () => _onApplyFilter(context),
                onFiltersReset: () => _resetFilters(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFilters() {
    return [
      CustomChips(
        items: ['Все', 'Не верифицированные', 'Верифицированные'],
        initialSelection: 0,
        onSelectionChanged: (selectedItems) {},
        spacing: 10,
        wrap: true,
      ),
      CustomSearchBar(
        controller: _searchController,
        hintText: 'Поиск',
      ),
    ];
  }

  void _onApplyFilter(BuildContext context) {}

  void _resetFilters() {}
}
