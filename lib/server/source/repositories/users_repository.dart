import 'package:admin_panel/server/server.dart';

class UsersRepository {
  final DioClient _dioClient;

  UsersRepository(this._dioClient);

  Future<UsersSearchResponse> getUsersSearch({
    required UsersSearchRequest request,
    required int page,
    required int limit,
  }) async {
    final response = await _dioClient.post(
      ApiEndpoints.userSearch,
      data: request.toJson(),
      queryParameters: {'page': page, 'limit': limit},
    );
    return UsersSearchResponse.fromJson(response.data);
  }
}
