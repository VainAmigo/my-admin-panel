import 'package:admin_panel/components/components.dart';
import 'package:admin_panel/core/core.dart';
import 'package:admin_panel/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvarRegisterView extends StatefulWidget {
  const AvarRegisterView({super.key});

  @override
  State<AvarRegisterView> createState() => _AvarRegisterViewState();
}

class _AvarRegisterViewState extends State<AvarRegisterView> {
  final TextEditingController _policyNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Filter(
          filterTitleText: 'Поиск',
          filterButtonText: 'Искать',
          isResetButtonVisible: false,
          onFiltersSet: () => _onSearch(),
          filtersList: _buildFilterWidgets(),
        ),
        BlocBuilder<AvarCubit, AvarState>(
          builder: (context, state) {
            switch (state) {
              case AvarInitial():
                return const SizedBox.shrink();
              case AvarLoading():
                return const CenteredIndicator();
              case AvarLoaded():
                return AvarRegisterTableWidget(data: state.data);
              case AvarError():
                return Text(state.error);
            }
          },
        ),
      ],
    );
  }

  void _onSearch() {
    if (_policyNumberController.text.isEmpty) {
      AppSnackbar.showInfo(context: context, title: 'Пожалуйста, введите номер полиса');
      return;
    }
    context.read<AvarCubit>().getAvarSearch(_policyNumberController.text.trim());
  }

  List<Widget> _buildFilterWidgets() {
    return [
      CustomSearchBar(
        controller: _policyNumberController,
        hintText: 'Поиск по номеру полиса',
        onSubmitted: (value) => _onSearch(),
      ),
    ];
  }
}
