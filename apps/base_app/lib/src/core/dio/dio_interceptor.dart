// import 'package:dio/dio.dart';
//
// class CustomInterceptor extends Interceptor {
//   @override
//   void onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     // Add token dynamically if available
//     final token = await _getToken();
//     if (token != null) {
//       options.headers['Authorization'] = 'Bearer $token';
//     }
//
//     return handler.next(options);
//   }
//
//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     // Handle status codes or redirect to login on 401
//     if (err.response?.statusCode == 401) {
//       // Token expired? Trigger re-authentication or refresh.
//     }
//     return handler.next(err);
//   }
//
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     return handler.next(response);
//   }
//
//   Future<String?> _getToken() async {
//     // Implement secure storage or token cache logic here
//     return null;
//   }
// }
