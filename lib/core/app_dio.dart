import 'package:dio/dio.dart';

/// This class provides a singleton instance of the Dio HTTP client for making
/// HTTP requests in the application. Using a singleton ensures that there is
/// only one instance of Dio throughout the application.
///
/// Example usage:
/// ```dart
/// final dio = AppDio().instance;
/// dio.get('https://example.com/api/data');
/// ```
class AppDio {
  static final AppDio _instance = AppDio._internal();

  factory AppDio() => _instance;

  AppDio._internal() {
    _dio.options.baseUrl = 'https://reactnd-books-api.udacity.com';
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = 'Any key as requested in API';
        return handler.next(options);
      },
    ));
    _dio.interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
    ));
    _dio.interceptors.add(MyInterceptor()); // adds custom interceptor
  }

  /// Returns the Dio HTTP client instance.
  ///
  /// Use this method to get the Dio instance for making HTTP requests.
  Dio get instance => _instance._dio;

  // options.header['Authentication'] setter for login capabilities
  set authHeader(String value) => _dio.options.headers['Authorization'] = value;

  final Dio _dio = Dio();
}

class MyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // here we can capture the requests and process them.
    handler.next(options);
  }
}
