import 'package:admin_panel/server/server.dart';

class VerificationRepository {
  final DioClient _dioClient;
  
  static const bool useMocks = true;

  VerificationRepository(this._dioClient);

  Future<VarificationListResponse> getVerificationList({
    required bool isVerified,
    int page = 1,
    int limit = 10,
  }) async {
    if (useMocks) {
      final mockData = isVerified 
          ? VerificationMocks.getVerifiedListMock(page: page, limit: limit)
          : VerificationMocks.getUnverifiedListMock(page: page, limit: limit);
      return VarificationListResponse.fromJson(mockData);
    }

    final response = await _dioClient.get(
      ApiEndpoints.avarVerifications,
      queryParameters: {
        'page': page,
        'limit': limit,
        'status': isVerified ? 'verified' : 'pending',
      },
    );
    return VarificationListResponse.fromJson(response.data);
  }
}
