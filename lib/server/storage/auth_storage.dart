import 'dart:convert';
import 'package:admin_panel/server/server.dart';

/// Service for storing and retrieving authentication-related data
class AuthStorage {
  final PreferencesStorage _storage;

  static const String _tokenKey = 'auth_token';
  static const String _userRolesKey = 'user_roles';
  static const String _accessiblePagesKey = 'accessible_pages';
  static const String _userDataKey = 'user_data';

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

  // User data methods
  Future<bool> saveUserData(LoginUserDataModel userData) async {
    try {
      final jsonString = jsonEncode(userData.toJson());
      return _storage.writeString(key: _userDataKey, value: jsonString);
    } catch (e) {
      return false;
    }
  }

  LoginUserDataModel? getUserData() {
    try {
      final jsonString = _storage.readString(key: _userDataKey);
      if (jsonString == null || jsonString.isEmpty) {
        return null;
      }
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return LoginUserDataModel.fromJson(json);
    } catch (e) {
      return null;
    }
  }

  // Clear all auth data
  Future<void> clearAuthData() async {
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _userRolesKey);
    await _storage.delete(key: _accessiblePagesKey);
    await _storage.delete(key: _userDataKey);
  }
}
