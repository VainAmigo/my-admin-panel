/// Enum representing user roles in the system
enum UserRole {
  /// Regular user no access
  user('USER'),

  /// Administrator with full access
  admin('ADMIN'),

  /// Avar user with access to avar
  avar('AVAR');

  const UserRole(this.value);

  /// String value of the role as received from API
  final String value;

  /// Parse a role string from API to UserRole enum
  static UserRole? fromString(String roleString) {
    try {
      return UserRole.values.firstWhere(
        (role) => role.value.toLowerCase() == roleString.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }

  /// Parse a list of role strings from API to `List<UserRole>`
  static List<UserRole> fromStringList(List<String> roleStrings) {
    return roleStrings
        .map((roleString) => fromString(roleString))
        .whereType<UserRole>()
        .toList();
  }

  /// Convert a list of UserRole to list of strings
  static List<String> toStringList(List<UserRole> roles) {
    return roles.map((role) => role.value).toList();
  }
}
