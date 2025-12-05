
import 'package:admin_panel/core/core.dart';

/// Service class for handling role-based access control
class RbacService {
  RbacService._();
  static final RbacService instance = RbacService._();

  /// Check if user has any of the required roles
  bool hasAnyRole(List<UserRole> userRoles, List<UserRole> requiredRoles) {
    if (requiredRoles.isEmpty) {
      return true; // No role requirement means accessible to all
    }

    return userRoles.any((userRole) => requiredRoles.contains(userRole));
  }

  /// Check if user has all of the required roles
  bool hasAllRoles(List<UserRole> userRoles, List<UserRole> requiredRoles) {
    if (requiredRoles.isEmpty) {
      return true;
    }

    return requiredRoles.every(
      (requiredRole) => userRoles.contains(requiredRole),
    );
  }

  /// Filter a list of items based on user roles
  /// Each item must have a getter for allowedRoles
  List<T> filterByRoles<T>({
    required List<T> items,
    required List<UserRole> userRoles,
    required List<UserRole> Function(T) getAllowedRoles,
  }) {
    return items.where((item) {
      final allowedRoles = getAllowedRoles(item);
      return hasAnyRole(userRoles, allowedRoles);
    }).toList();
  }
}
