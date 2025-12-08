import 'package:admin_panel/server/server.dart';

class AvarRepository {
  final DioClient _dioClient;

  AvarRepository(this._dioClient);

  Future<AvarPolicySearchResponse> getAvarSearch(String policyNumber) async {
    try {
      final String parameter = policyNumber.toUpperCase();
      final response = await _dioClient.get(
        '${ApiEndpoints.avarPolicySearch}/$parameter',
      );

      return AvarPolicySearchResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AvarCreateClaimResponse> createClaim(AvarCreateClaimRequest request) async { 
    try {
      final response = await _dioClient.post(
        ApiEndpoints.avarCreateClaim,
        data: request.toJson(),
      );

      return AvarCreateClaimResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AvarFilteredSearchResponse> getAvarFilteredSearch({
    required int page,
    required int limit,
    required AvarFilteredSearchRequest request,
  }) async {
    try {
      final response = await _dioClient.post(
        ApiEndpoints.avarFilteredSearch,
        queryParameters: {
          'page': page,
          'limit': limit,
        },
        data: request.toJson(),
      );

      return AvarFilteredSearchResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
