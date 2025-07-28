import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../l10n/app_localizations.dart';
import '../../data_access/state/user_bloc.dart';
import '../../data_access/state/user_event.dart';

class CreateUserWidget extends StatefulWidget {
  const CreateUserWidget({super.key});

  @override
  State<CreateUserWidget> createState() => _CreateUserWidgetState();
}

class _CreateUserWidgetState extends State<CreateUserWidget> {
  TextEditingController edtUserName = TextEditingController();
  TextEditingController edtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DSText(
              text: localizations.createUserHere,
              textStyle: DSTextStyleType.primaryButtonLMedium,
              textColor: Colors.black,
            ),
            const SizedBox(height: 16),
            DSTextInput(controller: edtUserName, label: 'Enter user name'),
            const SizedBox(height: 16),
            DSTextInput(controller: edtPassword, label: 'Enter password'),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: DSSemanticColors.appThemeSecondaryColor,
                padding: EdgeInsets.fromLTRB(64, 16, 64, 16),
              ),
              child: Text(
                localizations.createUser,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {
                context.read<UserBloc>().add(
                  CreateUserEvent(
                    username: edtUserName.text.trim(),
                    password: edtPassword.text.trim(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
