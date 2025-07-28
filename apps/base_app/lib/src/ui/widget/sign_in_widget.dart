import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/src/data_access/state/user_state.dart';
import 'package:flutter_base_app/src/ui/create_user_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../l10n/app_localizations.dart';
import '../../data_access/state/user_bloc.dart';
import '../../data_access/state/user_event.dart';
import '../product_listing_screen.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  TextEditingController edtUserName = TextEditingController();
  TextEditingController edtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return BlocListener<UserBloc, UserState>(
      listenWhen: (previous, current) => current is SignInSuccessState,
      listener: (context, state) async {
        if (state is SignInSuccessState) {
          String token = state.token;
          await saveLoginToken("Bearer $token");
          // Fluttertoast.showToast(
          //   msg: "User signIn successfully",
          //   toastLength: Toast.LENGTH_SHORT,
          //   gravity: ToastGravity.BOTTOM,
          //   backgroundColor: Colors.black54,
          //   textColor: Colors.white,
          //   fontSize: 16.0,
          // );
          if (context.mounted) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ProductListingScreen(),
              ),
            );
          }
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DSText(
                text: localizations.signInHere,
                textStyle: DSTextStyleType.primaryButtonLMedium,
                textColor: Colors.black,
              ),
              const SizedBox(height: 16),
              DSTextInput(controller: edtUserName, label: 'Enter user name'),
              const SizedBox(height: 16),
              DSTextInput(controller: edtPassword, label: 'Enter password'),
              const SizedBox(height: 32),

              // DSButtonPrimary.outline(
              //   text: localizations.signIn,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: DSSemanticColors.appThemeSecondaryColor,

                  padding: EdgeInsets.fromLTRB(64, 16, 64, 16),
                ),
                child: Text(
                  localizations.signIn,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {
                  context.read<UserBloc>().add(
                    SignInUserEvent(
                      username: edtUserName.text.trim(),
                      password: edtPassword.text.trim(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                      TextSpan(text: 'Don’t have an account? '),
                      TextSpan(
                        text: localizations.createUserHere,
                        style: TextStyle(
                          color: DSSemanticColors.appThemeSecondaryColor,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder:
                                        (context) => const CreateUserScreen(),
                                  ),
                                );
                              },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveLoginToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('login_token', token);
  }
}
