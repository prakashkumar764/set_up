import '../models/dto_models/user_dto.dart';

abstract interface class UserRemoteDataSource {
  Future<List<UserDTO>?> getUser({required String orderId});

  Future<UserDTO?> createUser({
    required String userName,
    required String password,
  });

  Future<UserDTO?> signInUser({
    required String userName,
    required String password,
  });
}
