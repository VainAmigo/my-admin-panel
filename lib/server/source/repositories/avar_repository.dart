import 'package:admin_panel/server/server.dart';

class AvarRepository {
  final DioClient _dioClient;

  AvarRepository(this._dioClient);

  Future<AvarPolicySearchResponse> getAvarSearch(String policyNumber) async {
    try {
      final response = await _dioClient.get(
        '${ApiEndpoints.avarPolicySearch}/$policyNumber',
      );

      return AvarPolicySearchResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
