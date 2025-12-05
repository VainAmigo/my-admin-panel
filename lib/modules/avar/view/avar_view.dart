import 'package:admin_panel/config/config.dart';
import 'package:admin_panel/modules/modules.dart';
import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

class AvarView extends StatefulWidget {
  const AvarView({super.key});

  @override
  State<AvarView> createState() => _AvarViewState();
}

class _AvarViewState extends State<AvarView> {
  TabType _selectedTab = TabType.registered;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: AppSizing.spaceBtwSection,
              vertical: Responsive.isMobile(context)
                  ? AppSizing.spaceBtwSection
                  : AppSizing.space50,
            ),
            child: Column(
              children: [
                AvarTabsWidget(
                  selectedTab: _selectedTab,
                  onTabSelected: _selectTab,
                ),
                _buildAvarContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectTab(TabType tabType) {
    setState(() {
      _selectedTab = tabType;
    });
  }

  Widget _buildAvarContent() {
    switch (_selectedTab) {
      case TabType.registered:
        return Center(child: Text('Регистрация аварии'));
      case TabType.drafted:
        return Center(child: Text('Черновик аварии'));
      case TabType.approved:
        return Center(child: Text('Зарегистрированная авария'));
    }
  }
}

enum TabType {
  registered('Регистрация аварии', AppColors.primary25, '10'),
  drafted('Черновик аварии', AppColors.primary75, '101'),
  approved('Зарегистрированная авария', AppColors.primary50, '2343');

  const TabType(this.title, this.color, this.count);
  final String title;
  final Color color;
  final String count;
}
