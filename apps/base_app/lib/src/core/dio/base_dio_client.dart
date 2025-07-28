// import 'package:dio/dio.dart';
// import 'dio_interceptor.dart';
//
// class BaseDioClient {
//   static final BaseDioClient _instance = BaseDioClient._internal();
//   factory BaseDioClient() => _instance;
//   late final Dio dio;
//
//   BaseDioClient._internal() {
//     final baseOptions = BaseOptions(
//       baseUrl: const String.fromEnvironment(
//         'API_BASE_URL',
//         defaultValue: 'https://api.example.com',
//       ),
//       connectTimeout: const Duration(seconds: 5),
//       receiveTimeout: const Duration(seconds: 5),
//       sendTimeout: const Duration(seconds: 5),
//       headers: {
//         'Accept': 'application/json',
//         'Content-Type': 'application/json',
//       },
//     );
//
//     dio = Dio(baseOptions);
//
//     // Interceptors: Logging, Auth, Error Handling
//     dio.interceptors.addAll([CustomInterceptor()]);
//   }
// }
