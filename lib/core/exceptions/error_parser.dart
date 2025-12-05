import 'package:admin_panel/server/server.dart';
import 'package:dio/dio.dart';

abstract class ErrorParser {
  static String? parse(Object? error) {
    if (error is String) return error;
    if (error is Map<String, dynamic>) {
      if (error.containsKey('message')) return error['message'].toString();
    } else if (error is RemoteException) {
      final dioException = error.dioException;
      final response = dioException?.response;
      if (response != null) {
        final data = response.data;
        if (data is String) return response.toString();
        if (data is Map<String, dynamic>) {
          if (data.containsKey('message')) return data['message'].toString();
        }
      }
      if (dioException?.message != null) {
        return dioException?.message;
      }
    } else if (error is DioException) {
      final response = error.response;
      if (response != null) {
        final data = response.data;
        if (data is String) return response.toString();
        if (data is Map<String, dynamic>) {
          if (data.containsKey('message')) return data['message'].toString();
        }
      }
      if (error.message != null) {
        return error.message;
      }
    }

    return null;
  }
}
