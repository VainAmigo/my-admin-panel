import 'package:admin_panel/server/server.dart';

/// Service for storing and retrieving authentication-related data
class AuthStorage {
  final PreferencesStorage _storage;

  static const String _tokenKey = 'auth_token';
  static const String _userRolesKey = 'user_roles';
  static const String _accessiblePagesKey = 'accessible_pages';

  AuthStorage(this._storage);

  // Token methods
  Future<bool> saveToken(String token) async {
    return _storage.writeString(key: _tokenKey, value: token);
  }

  String? getToken() {
    return _storage.readString(key: _tokenKey);
  }

  // User roles methods
  Future<bool> saveUserRoles(List<String> roles) async {
    return _storage.writeStringList(key: _userRolesKey, value: roles);
  }

  List<String> getUserRoles() {
    return _storage.readStringList(key: _userRolesKey) ?? [];
  }

  // Accessible pages methods
  Future<bool> saveAccessiblePages(List<String> pages) async {
    return _storage.writeStringList(key: _accessiblePagesKey, value: pages);
  }

  List<String> getAccessiblePages() {
    return _storage.readStringList(key: _accessiblePagesKey) ?? [];
  }

  // Clear all auth data
  Future<void> clearAuthData() async {
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _userRolesKey);
    await _storage.delete(key: _accessiblePagesKey);
  }
}
