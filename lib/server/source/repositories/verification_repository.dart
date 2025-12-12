import 'package:admin_panel/server/server.dart';

class VerificationRepository {
  final DioClient _dioClient;

  VerificationRepository(this._dioClient);

  Future<VerificationListResponse> getVerificationList({
    required VerificationListRequest request,
    required int page,
    required int limit,
  }) async {
    final response = await _dioClient.post(
      ApiEndpoints.avarVerifications,
      data: request.toJson(),
      queryParameters: {'page': page, 'limit': limit},
    );
    return VerificationListResponse.fromJson(response.data);
  }

  Future<void> setVerificationStatus({
    required VerificationSetVerificationStatusBody body,
    required int id,
  }) async {
    await _dioClient.put(
      '/api/$id/verification-status',
      data: body.toJson(),
    );
  }
}
