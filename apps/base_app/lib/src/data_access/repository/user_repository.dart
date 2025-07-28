import '../models/user.dart';

abstract interface class UserRepository {
  Future<List<User>?> getUser({required String orderId});

  Future<User?> createUser({
    required String userName,
    required String password,
  });

  Future<User?> signInUser({
    required String userName,
    required String password,
  });
}
