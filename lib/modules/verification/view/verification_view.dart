import 'package:admin_panel/components/components.dart';
import 'package:admin_panel/modules/modules.dart';
import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  VerificationTabType _selectedTab = VerificationTabType.unverified;

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
              _buildTabs(),
              SizedBox(height: AppSizing.spaceBtwSection,),
              _buildVerificationContent(),
            ],
          ),
        ),
      ),
    );
  }

  void _selectTab(VerificationTabType tabType) {
    setState(() {
      _selectedTab = tabType;
    });
  }

  Widget _buildTabs() {
    return Row(
      spacing: AppSizing.spaceBtwItm,
      children: [
        Expanded(child: TabCard(title: 'Не верифицированные', isActive: _selectedTab == VerificationTabType.unverified, onTap: () => _selectTab(VerificationTabType.unverified))),
        Expanded(child: TabCard(title: 'Верифицированные', isActive: _selectedTab == VerificationTabType.verified, onTap: () => _selectTab(VerificationTabType.verified))),
      ],
    );
  }

  Widget _buildVerificationContent() {
    switch (_selectedTab) {
      case VerificationTabType.unverified:
        return const UnverifiedTabView(key: ValueKey('unverified'));
      case VerificationTabType.verified:
        return const VerifiedTabView(key: ValueKey('verified'));
    }
  }
}

enum VerificationTabType {
  unverified('Не верифицированные'),
  verified('Верифицированные');

  const VerificationTabType(this.title);
  final String title;
}