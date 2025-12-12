import 'package:admin_panel/core/rbac/user_role.dart';
import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

/// Утилита для получения переведенного текста и цветов ролей пользователей
class UserRoleUtil {
  /// Возвращает переведенный текст для роли пользователя
  static String getRoleText(UserRole? role) {
    if (role == null) return '';

    switch (role) {
      case UserRole.admin:
        return 'Администратор';
      case UserRole.superadmin:
        return 'Супер администратор';
      case UserRole.user:
        return 'Пользователь';
      case UserRole.avarSpecialist:
        return 'Аварийный комиссар';
      case UserRole.accountant:
        return 'Бухгалтер';
    }
  }

  /// Возвращает переведенный текст для роли по строковому коду
  static String getRoleTextByCode(String? roleCode) {
    if (roleCode == null || roleCode.isEmpty) return '';
    final role = UserRole.fromString(roleCode);
    return getRoleText(role);
  }

  /// Возвращает цвет для роли пользователя
  static Color getRoleColor(UserRole? role) {
    if (role == null) return AppColors.grey;

    switch (role) {
      case UserRole.superadmin:
        return AppColors.oragne;
      case UserRole.admin:
        return AppColors.oragne;
      case UserRole.accountant:
        return AppColors.primary;
      case UserRole.avarSpecialist:
        return AppColors.primary;
      case UserRole.user:
        return AppColors.grey;
    }
  }

  /// Возвращает цвет для роли по строковому коду
  static Color getRoleColorByCode(String? roleCode) {
    if (roleCode == null || roleCode.isEmpty) return AppColors.grey;
    final role = UserRole.fromString(roleCode);
    return getRoleColor(role);
  }
}
