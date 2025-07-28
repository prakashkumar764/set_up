import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/src/ui/widget/sign_in_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:network/network.dart';

import '../../l10n/app_localizations.dart';
import '../data_access/data_source/default_user_remote_data_source.dart';
import '../data_access/repository/default_user_repository.dart';

import '../data_access/state/user_bloc.dart';
import '../data_access/state/user_event.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final userRepository = DefaultUserRepository(
      DefaultUserRemoteDataSource(BaseDioClient()),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations.signInScreen,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: DSSemanticColors.appThemePrimaryColor,
      ),
      body: BlocProvider<UserBloc>(
        create:
            (context) =>
                UserBloc(userRepository: userRepository)
                  ..add(UserInitialEvent()),
        child: const SignInWidget(),
      ),
    );
  }
}
