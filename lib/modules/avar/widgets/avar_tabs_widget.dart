import 'package:admin_panel/components/components.dart';
import 'package:admin_panel/config/config.dart';
import 'package:admin_panel/modules/modules.dart';
import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

class AvarTabsWidget extends StatelessWidget {
  const AvarTabsWidget({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  final TabType selectedTab;
  final Function(TabType) onTabSelected;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Column(
        key: const ValueKey('avar_tabs_mobile'),
        spacing: AppSizing.spaceBtwItm,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: TabType.values.map((tabType) {
          return TabCard(
            key: ValueKey('avar_tab_${tabType.name}'),
            title: tabType.title,
            isActive: selectedTab == tabType,
            onTap: () => onTabSelected(tabType),
          );
        }).toList(),
      ),
      desktop: Row(
        key: const ValueKey('avar_tabs_desktop'),
        children: TabType.values.asMap().entries.map((entry) {
          final index = entry.key;
          final tabType = entry.value;
          return Expanded(
            key: ValueKey('avar_tab_desktop_${tabType.name}'),
            child: Padding(
              padding: EdgeInsets.only(
                right: index < TabType.values.length - 1
                    ? AppSizing.spaceBtwSection
                    : 0,
              ),
              child: TabCard(
                key: ValueKey('avar_tab_${tabType.name}'),
                title: tabType.title,
                isActive: selectedTab == tabType,
                onTap: () => onTabSelected(tabType),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
