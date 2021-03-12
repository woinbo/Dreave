import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:solution_challenge/UI/views/homeScreen/homeScreen.dart';
import 'package:solution_challenge/config/constant.dart';
import 'package:solution_challenge/data/models/user.dart';
import 'package:solution_challenge/utils/custom_shared_preferences.dart';
import '../../../utils/state_control.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

class AuthController extends StateControl with WidgetsBindingObserver {
  //instance:
  firebase.FirebaseAuth? auth;
  final BuildContext context;
  bool _isLoading = false;
  bool get isLoading => this._isLoading;
  String _contactText = '';
  String get contactText => this._contactText;
  late GoogleSignIn _googleSignIn;
  String _smsCode = '';
  smsCode(code) => _smsCode = code;

  AuthController({
    required this.context,
  }) {
    this.init();
  }

  init() {
    //inisilazation
    auth = firebase.FirebaseAuth.instance;
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
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => HomeScreen()),
                  (Route<dynamic> route) => false),
              // Navigator.pushNamedAndRemoveUntil(
              //     context, ROUTES.HOME, (Route<dynamic> route) => false),
            },
          );
      _isLoading = false;
    } catch (error) {
      await CustomSharedPreferences.setBool(IS_LOGGED_IN, false);
      print(error);
      _isLoading = false;
    }
  }

  // Emaill Authontication
  Future<void> createAccountWithEmailAndPassword(email, password) async {
    try {
      // firebase.UserCredential userCredential =
      await auth!
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        User _user = User(
          id: value.user!.uid,
          email: value.user!.email,
          photoUrl: value.user!.photoURL,
          displayName: value.user!.displayName,
        );

        await CustomSharedPreferences.setString(
            USER, jsonEncode(_user).toString());
        print("Account created");
        Navigator.pushNamed(context, ROUTES.HOME);
      });
    } on firebase.FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        try {
          // firebase.UserCredential userCredential =
          await auth!
              .signInWithEmailAndPassword(email: email, password: password)
              .then((value) async {
            User _user = User(
              id: value.user!.uid,
              email: value.user!.email,
              photoUrl: value.user!.photoURL,
              displayName: value.user!.displayName,
            );
            print("Account signed");
            await CustomSharedPreferences.setString(
                USER, jsonEncode(_user).toString());
          });
          Navigator.pushNamed(context, ROUTES.HOME);
        } on firebase.FirebaseAuthException catch (e) {
          if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
          } else {
            print(e.code.toString());
          }
        }
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  // Phone Auth
  Future<void> phoneAuth(phone) async {
    await firebase.FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91" + phone,
      verificationCompleted: (firebase.PhoneAuthCredential credential) async {
        await auth!.signInWithCredential(credential);
      },
      verificationFailed: (firebase.FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code

        // Create a PhoneAuthCredential with the code
        firebase.AuthCredential phoneAuthCredential =
            firebase.PhoneAuthProvider.credential(
                verificationId: verificationId, smsCode: _smsCode);

        // Sign the user in (or link) with the credential
        await auth!.signInWithCredential(phoneAuthCredential);
      },
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {
        print("time-out");
      },
    );
  }

  handleSignOut() async {
    _googleSignIn.disconnect();
    await firebase.FirebaseAuth.instance.signOut();
  }
}
