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
    final Size size = MediaQuery.of(context).size;
    return Responsive(
      mobile: AvarTabsGridView(
        crossAxisCount: 2,
        childAspectRatio: size.width < 650 ? 1.2 : 1.9,
        selectedTab: selectedTab,
        onTabSelected: onTabSelected,
        iconSize: size.width > 420 ? 50 : 40,
      ),
      tablet: AvarTabsGridView(
        crossAxisCount: 3,
        childAspectRatio: size.width < 900 ? 1.2 : 1.5,
        selectedTab: selectedTab,
        onTabSelected: onTabSelected,
        iconSize: 50,
      ),
      desktop: AvarTabsGridView(
        crossAxisCount: 3,
        childAspectRatio: size.width > 1300 ? 3 : 1.8,
        selectedTab: selectedTab,
        onTabSelected: onTabSelected,
        iconSize: size.width > 1380 ? 100 : 80,
      ),
    );
  }
}

class AvarTabsGridView extends StatelessWidget {
  const AvarTabsGridView({
    super.key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.4,
    required this.selectedTab,
    required this.onTabSelected,
    this.iconSize,
  });

  final int crossAxisCount;
  final double childAspectRatio;
  final TabType selectedTab;
  final Function(TabType) onTabSelected;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: AppSizing.spaceBtwSection,
        mainAxisSpacing: AppSizing.spaceBtwSection,
      ),
      children: TabType.values.map((tabType) {
        return AvarTabCard(
          title: tabType.title,
          count: tabType.count,
          isActive: selectedTab == tabType,
          onTap: () => onTabSelected(tabType),
          dotColor: tabType.color,
        );
      }).toList(),
    );
  }
}
