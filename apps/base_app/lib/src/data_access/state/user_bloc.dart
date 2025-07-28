import 'package:flutter/material.dart';
import 'package:flutter_base_app/src/data_access/state/user_event.dart';
import 'package:flutter_base_app/src/data_access/state/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../repository/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitialState()) {
    on<UserInitialEvent>((event, emit) async {});

    on<CreateUserEvent>((event, emit) async {
      final user = await userRepository.createUser(
        userName: event.username,
        password: event.password,
      );

      debugPrint("==========$user");
      if (user?.userName != null) {
        Fluttertoast.showToast(
          msg: "User created successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        emit(
          CreateUserState(userName: user!.userName, password: user.password),
        );
      }
    });

    on<SignInUserEvent>((event, emit) async {
      final result = await userRepository.signInUser(
        userName: event.username,
        password: event.password,
      );

      if (result?.userName != null) {
        emit(SignInSuccessState(token: result?.id ?? ""));
      }
    });
  }
}
