abstract class UserEvent {
  const UserEvent();
}

class UserInitialEvent extends UserEvent {}

class CreateUserEvent extends UserEvent {
  final String username;
  final String password;
  const CreateUserEvent({required this.username, required this.password});
}

class SignInUserEvent extends UserEvent {
  final String username;
  final String password;
  const SignInUserEvent({required this.username, required this.password});
}
