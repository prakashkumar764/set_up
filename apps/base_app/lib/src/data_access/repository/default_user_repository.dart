import 'package:flutter_base_app/src/data_access/models/user.dart';
import 'package:flutter_base_app/src/data_access/models/user_mapper.dart';
import 'package:flutter_base_app/src/data_access/repository/user_repository.dart';

import '../data_source/default_user_remote_data_source.dart';

class DefaultUserRepository implements UserRepository {
  final DefaultUserRemoteDataSource dataSource;

  static DefaultUserRepository? _instance;

  DefaultUserRepository._internal(this.dataSource);

  factory DefaultUserRepository(DefaultUserRemoteDataSource dataSource) {
    return _instance ??= DefaultUserRepository._internal(dataSource);
  }

  @override
  Future<List<User>?> getUser({required String orderId}) async {
    final dtoList = await dataSource.getUser(orderId: orderId);
    if (dtoList == null) return null;

    return dtoList.map((dto) => dto.toDomain()).toList();
  }

  @override
  Future<User?> createUser({
    required String userName,
    required String password,
  }) async {
    final userDto = await dataSource.createUser(
      userName: userName,
      password: password,
    );
    return userDto?.toDomain();
  }

  @override
  Future<User?> signInUser({
    required String userName,
    required String password,
  }) async {
    final userDto = await dataSource.signInUser(
      userName: userName,
      password: password,
    );
    return userDto?.toDomain();
  }
}
