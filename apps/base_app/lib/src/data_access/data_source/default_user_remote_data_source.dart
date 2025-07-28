import 'package:flutter_base_app/src/data_access/data_source/user_remote_data_source.dart';
import 'package:flutter_base_app/src/data_access/models/dto_models/user_dto.dart';
import 'package:network/network.dart';

class DefaultUserRemoteDataSource implements UserRemoteDataSource {
  final BaseDioClient baseDioClient;
  static DefaultUserRemoteDataSource? _instance;

  DefaultUserRemoteDataSource._internal(this.baseDioClient);

  factory DefaultUserRemoteDataSource(BaseDioClient baseDioClient) {
    return _instance ??= DefaultUserRemoteDataSource._internal(baseDioClient);
  }

  @override
  Future<List<UserDTO>?> getUser({required String orderId}) async {
    final response = await baseDioClient.get(
      'https://demo-api-design.onrender.com/user',
    );

    final data = response.data;
    List<UserDTO> userList = data;
    return userList;
  }

  @override
  Future<UserDTO?> createUser({
    required String userName,
    required String password,
  }) async {
    final payload = {'userName': userName, 'password': password};

    final response = await baseDioClient.post(
      'https://demo-api-design.onrender.com/user',
      payload: payload,
    );

    final data = response.data;
    if (data is Map<String, dynamic>) {
      //UserDTO.fromJson(data
      return UserDTO(userName: userName, password: password, id: data['token']);
    } else {
      throw Exception("Unexpected response format from createUser.");
    }
  }

  @override
  Future<UserDTO?> signInUser({
    required String userName,
    required String password,
  }) async {
    final payload = {'userName': userName, 'password': password};

    final response = await baseDioClient.post(
      'https://demo-api-design.onrender.com/signin',
      payload: payload,
    );

    final data = response.data;
    if (data is Map<String, dynamic>) {
      //UserDTO.fromJson(data
      return UserDTO(userName: userName, password: password, id: data['token']);
    } else {
      throw Exception("Unexpected response format from createUser.");
    }
  }
}
