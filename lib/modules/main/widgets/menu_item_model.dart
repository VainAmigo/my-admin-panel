import 'package:admin_panel/core/core.dart';
import 'package:flutter/material.dart';

enum MenuItem {
  analytics,
  reports,
  accounting,
  avar,
  verification,
  users,
  profile,
  notifications,
}

class MenuItemModel {
  final String icon;
  final String title;
  final VoidCallback onTap;
  final bool isExit;
  final MenuItem? menuItem;
  final List<UserRole> allowedRoles;

  MenuItemModel({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isExit = false,
    this.menuItem,
    this.allowedRoles = const [],
  });
}

