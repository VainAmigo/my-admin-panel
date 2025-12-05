import 'package:admin_panel/server/server.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  const AuthInterceptor({required this.storage, required this.dio});

  final PreferencesStorage storage;
  final Dio dio;

  // Token yenileme işlemi sırasında olup olmadığımızı takip etmek için
  static bool _isRefreshing = false;

  // Bekleyen istekleri tutmak için
  static final List<_RequestExecutor> _pendingRequests = [];

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Token hatası ve refresh endpoint'i değilse
    if ((err.response?.statusCode == 401 || err.response?.statusCode == 403) &&
        (!err.requestOptions.path.contains('/api/v1/auth/refresh') &&
            !err.requestOptions.path.contains('delete-account'))) {
      final refreshToken = storage.readString(key: 'refresh_token');

      if (refreshToken == null) {
        // Refresh token yoksa, hatayı ilet
        return handler.next(err);
      }

      // Orijinal isteği kuyruğa ekle
      final executor = _RequestExecutor(
        requestOptions: err.requestOptions,
        handler: handler,
        error: err,
      );

      if (_isRefreshing) {
        // Zaten token yeniliyorsa, isteği kuyruğa ekle ve bekle
        _pendingRequests.add(executor);
        return;
      }

      _isRefreshing = true;

      try {
        // Token yenileme için ayrı bir Dio instance kullan
        final refreshDio = Dio(
          BaseOptions(
            baseUrl: err.requestOptions.baseUrl,
            headers: {'Content-Type': 'application/json'},
          ),
        );

        final response = await refreshDio.post<Map<String, dynamic>>(
          '/api/v1/auth/refresh',
          data: {'refreshToken': refreshToken},
        );

        if (response.statusCode == 200 && response.data != null) {
          final data = response.data!;
          final accessToken = data['accessToken'];
          final newRefreshToken = data['refreshToken'];

          // Yeni token'ları kaydet
          storage.writeString(key: 'access_token', value: accessToken);
          storage.writeString(key: 'refresh_token', value: newRefreshToken);

          // Tüm bekleyen istekleri yeni token ile yeniden gönder
          _pendingRequests.add(executor);
          await _processQueue(accessToken);
        } else {
          // Token yenileme başarısız, tüm istekleri başarısız olarak işaretle
          _pendingRequests.add(executor);
          _processFailedQueue(err);
        }
      } catch (e) {
        // Token yenileme hatası, tüm istekleri başarısız olarak işaretle
        _pendingRequests.add(executor);
        _processFailedQueue(err);
      } finally {
        _isRefreshing = false;
      }
    } else {
      // 401/403 olmayan hatalar için normal akışa devam et
      handler.next(err);
    }
  }

  // Bekleyen istekleri yeni token ile işle
  Future<void> _processQueue(String newToken) async {
    final requests = List<_RequestExecutor>.from(_pendingRequests);
    _pendingRequests.clear();

    for (final request in requests) {
      try {
        // İsteği kopyala ve yeni token ekle
        final requestOptions = request.requestOptions;
        requestOptions.headers['Authorization'] = 'Bearer $newToken';

        // İsteği orijinal Dio instance ile tekrar gönder
        final response = await dio.fetch(requestOptions);
        request.handler.resolve(response);
      } catch (e) {
        // Yeniden deneme başarısız, orijinal hatayı ilet
        request.handler.reject(request.error);
      }
    }
  }

  // Bekleyen istekleri hata ile işle
  void _processFailedQueue(DioException err) {
    final requests = List<_RequestExecutor>.from(_pendingRequests);
    _pendingRequests.clear();

    for (final request in requests) {
      request.handler.reject(err);
    }
  }
}

// Bekleyen istekleri takip etmek için yardımcı sınıf
class _RequestExecutor {
  final RequestOptions requestOptions;
  final ErrorInterceptorHandler handler;
  final DioException error;

  _RequestExecutor({
    required this.requestOptions,
    required this.handler,
    required this.error,
  });
}
