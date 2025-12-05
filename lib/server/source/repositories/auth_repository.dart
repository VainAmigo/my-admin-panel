import 'package:admin_panel/server/server.dart';

class AuthRepository {
  final DioClient _dioClient;

  AuthRepository(this._dioClient);

  Future<AuthResponse> login(String username, String password) async {
    try {
      final response = await _dioClient.post(
        ApiEndpoints.login,
        queryParameters: {'username': username, 'password': password},
      );

      return AuthResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _dioClient.post(ApiEndpoints.logout);
    } catch (e) {
      rethrow;
    }
  }
}
