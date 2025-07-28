import 'package:design_system/theme/colors/semantic_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/l10n/app_localizations.dart';
import 'package:flutter_base_app/src/ui/widget/create_user_widget.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network/network.dart';
import '../data_access/data_source/default_user_remote_data_source.dart';
import '../data_access/repository/default_user_repository.dart';
import '../data_access/state/user_bloc.dart';
import '../data_access/state/user_event.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final userRepository = DefaultUserRepository(
      DefaultUserRemoteDataSource(BaseDioClient()),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations.createUserScreen,
          style: TextStyle(color: Colors.white),
        ),
        leading: BackButton(color: Colors.white),
        backgroundColor: DSSemanticColors.appThemePrimaryColor,
      ),
      body: BlocProvider<UserBloc>(
        create:
            (context) =>
                UserBloc(userRepository: userRepository)
                  ..add(UserInitialEvent()),
        child: const CreateUserWidget(),
      ),
    );
  }
}
