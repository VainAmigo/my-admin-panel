import 'package:admin_panel/consts/consts.dart';

class ApiEndpoints {
  static const String baseUrl = ApiConsts.baseUrl;
  static const String login = '/api/auth/login';
  static const String logout = '/api/auth/logout';
  static const String avarPolicySearch = '/api/accidents/policy';
  static const String avarFilteredSearch = '/api/accidents/filtered-search';
  static const String avarCreateClaim = '/api/accidents/create-claim';
  static const String userSearch = '/api/users/search';
}
