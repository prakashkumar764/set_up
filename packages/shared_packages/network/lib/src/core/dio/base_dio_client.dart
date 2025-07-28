import 'package:dio/dio.dart';
import 'dio_interceptor.dart';

class BaseDioClient {
  static final BaseDioClient _instance = BaseDioClient._internal();
  factory BaseDioClient() => _instance;
  late final Dio _dio;

  BaseDioClient._internal() {
    final baseOptions = BaseOptions(
      baseUrl: const String.fromEnvironment(
        'API_BASE_URL',
        defaultValue: 'https://api.example.com',
      ),
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      sendTimeout: const Duration(seconds: 5),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    _dio = Dio(baseOptions);

    // Interceptors: Logging, Auth, Error Handling
    _dio.interceptors.addAll([CustomInterceptor()]);
  }

  /// Generic GET
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioError catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  /// Generic POST
  Future<Response> post(
    String path, {
    dynamic payload,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post(
        path,
        data: payload,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioError catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  /// Generic PUT
  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioError catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  /// Generic DELETE
  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioError catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  /// PATCH (optional)
  Future<Response> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioError catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  void _handleDioError(DioError e) {
    // You can expand this to log to Firebase, Sentry, etc.
    print('DioError [${e.type}] -> ${e.message}');
    if (e.response != null) {
      print('Status: ${e.response?.statusCode}, Data: ${e.response?.data}');
    }
  }
}
