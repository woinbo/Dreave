import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:solution_challenge/config/constant.dart';
import 'package:solution_challenge/data/models/user.dart';
import 'package:solution_challenge/utils/custom_shared_preferences.dart';
import '../../../utils/state_control.dart';
import 'package:provider/provider.dart';

class AuthController extends StateControl with WidgetsBindingObserver {
  final BuildContext context;
  bool _isLoading = false;
  bool get isLoading => this._isLoading;
  String _contactText = '';
  String get contactText => this._contactText;
  late GoogleSignIn _googleSignIn;

  AuthController({
    required this.context,
  }) {
    this.init();
  }

  init() {
    _googleSignIn = GoogleSignIn(
      scopes: <String>[
        'email',
      ],
    );
    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      notifyListeners();
      User _user = User(
        id: account!.id,
        email: account.email,
        photoUrl: account.photoUrl,
        displayName: account.displayName,
      );

      await CustomSharedPreferences.setString(
          USER, jsonEncode(_user).toString());
      Navigator.pushNamed(context, ROUTES.HOME);
    });
    _googleSignIn.signInSilently();
  }

  Future<void> handleSignIn() async {
    try {
      _isLoading = true;
      await _googleSignIn.signIn().then(
            (value) async => {
              await CustomSharedPreferences.setString(USER, value.toString()),
              await CustomSharedPreferences.setBool(IS_LOGGED_IN, true),
              Navigator.pushNamed(context, ROUTES.HOME),
            },
          );
      _isLoading = false;
    } catch (error) {
      await CustomSharedPreferences.setBool(IS_LOGGED_IN, false);
      print(error);
      _isLoading = false;
    }
  }

  Future<void> handleSignOut() => _googleSignIn.disconnect();
}
