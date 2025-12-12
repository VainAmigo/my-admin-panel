import 'package:admin_panel/components/components.dart';
import 'package:admin_panel/config/config.dart';
import 'package:admin_panel/core/core.dart';
import 'package:flutter/material.dart';

class UsersFiltersWidget extends StatelessWidget {
  const UsersFiltersWidget({
    super.key,
    required this.phoneNumberController,
    required this.idController,
    required this.selectedRole,
    required this.onRoleChanged,
    required this.onSearch,
    required this.onResetFilters,
  });

  final TextEditingController phoneNumberController;
  final TextEditingController idController;
  final String? selectedRole;
  final ValueChanged<String?> onRoleChanged;
  final VoidCallback onSearch;
  final VoidCallback onResetFilters;

  @override
  Widget build(BuildContext context) {
    return Filter(
      filterTitleText: 'Фильтры',
      filterButtonText: 'Применить',
      isResetButtonVisible: true,
      onFiltersSet: onSearch,
      onFiltersReset: onResetFilters,
      filtersList: [
        CustomSearchBar(
          controller: phoneNumberController,
          hintText: 'Поиск по номеру телефона',
          onSubmitted: (value) => onSearch(),
        ),
        CustomSearchBar(
          controller: idController,
          hintText: 'Поиск по ID пользователя',
          onSubmitted: (value) => onSearch(),
        ),
        CustomDropdown<String>(
          width: Responsive.isDesktop(context) ? 200 : double.infinity,
          value: selectedRole,
          items: _buildDropdownItems(),
          onChanged: onRoleChanged,
          itemBuilder: (value) => _getRoleLabel(value),
        ),
      ],
    );
  }

  List<String> _buildDropdownItems() {
    return UserRole.values.map((role) => role.value).toList();
  }

  String _getRoleLabel(String role) {
    final userRole = UserRole.fromString(role);
    return UserRoleUtil.getRoleText(userRole);
  }
}

