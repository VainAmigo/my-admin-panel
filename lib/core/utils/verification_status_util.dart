import 'package:admin_panel/server/server.dart';
import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

/// Утилита для получения переведенного текста и цветов статуса верификации
class VerificationStatusUtil {
  /// Возвращает переведенный текст для статуса верификации
  static String getStatusText(VerificationStatus? status) {
    if (status == null) return '';

    switch (status) {
      case VerificationStatus.verified:
        return 'Верифицирован';
      case VerificationStatus.pending:
        return 'Ожидает проверки';
      case VerificationStatus.notVerified:
        return 'Не верифицирован';
      case VerificationStatus.rejected:
        return 'Отклонен';
    }
  }

  /// Возвращает цвет для статуса верификации
  static Color getStatusColor(VerificationStatus? status) {
    if (status == null) return AppColors.grey;

    switch (status) {
      case VerificationStatus.verified:
        return AppColors.green;
      case VerificationStatus.pending:
        return AppColors.oragne;
      case VerificationStatus.notVerified:
        return AppColors.oragne;
      case VerificationStatus.rejected:
        return AppColors.red;
    }
  }

  /// Возвращает оригинальное строковое значение статуса верификации
  static String getStatusOriginalValue(VerificationStatus? status) {
    if (status == null) return '';

    switch (status) {
      case VerificationStatus.verified:
        return 'VERIFIED';
      case VerificationStatus.pending:
        return 'PENDING';
      case VerificationStatus.notVerified:
        return 'NOT_VERIFIED';
      case VerificationStatus.rejected:
        return 'REJECTED';
    }
  }
}