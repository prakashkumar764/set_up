// import 'package:dio/dio.dart';
// import '../dio/base_dio_client.dart';
//
// class NetworkService {
//   final Dio _dio = BaseDioClient().dio;
//
//   Future<List<dynamic>> fetchUser() async {
//     final response = await _dio.get('/user');
//     return response.data;
//   }
//
//   Future<void> createUser(String name, String password) async {
//     await _dio.post('/user', data: {'name': name, 'password': password});
//   }
// }
