abstract class UserState {
  const UserState();
}

class UserInitialState implements UserState {}

class CreateUserState implements UserState {
  final String userName;
  final String password;

  const CreateUserState({required this.userName, required this.password});
}

class SignInSuccessState implements UserState {
  final String token;
  const SignInSuccessState({required this.token});
}
