// import 'dart:convert';
// import 'dart:core';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:solution_challenge/UI/views/homeScreen/homeScreen.dart';
// import 'package:solution_challenge/UI/widgets/alert_box.dart';
// import 'package:solution_challenge/config/constant.dart';
// import 'package:solution_challenge/data/models/user.dart';
// import 'package:solution_challenge/utils/custom_shared_preferences.dart';
// import '../../../utils/state_control.dart';
// import 'package:firebase_auth/firebase_auth.dart' as firebase;

// class AuthController extends StateControl with WidgetsBindingObserver {
//   //instance:
//   firebase.FirebaseAuth? auth;
//   final BuildContext context;
//   BuildContext? dialogContext;
//   bool _isLoading = false;
//   bool get isLoading => this._isLoading;
//   String _contactText = '';
//   String get contactText => this._contactText;
//   late GoogleSignIn _googleSignIn;
//   String _smsCode = '';
//   String? _verificationId;
//   TextEditingController nameController = TextEditingController();
//   TextEditingController phoneNoController = TextEditingController();

//   bool _isFormValid = false;
//   get isFormValid => _isFormValid;

//   bool _error = false;
//   bool get error => _error;

//   bool _loading = false;
//   bool get loading => _loading;

//   smsCode(code) => _smsCode = code;

//   AuthController({
//     required this.context,
//   }) {
//     this.init();
//   }

//   init() {
//     this.nameController.addListener(this.validateForm);
//     this.phoneNoController.addListener(this.validateForm);
//     //inisilazation
//     auth = firebase.FirebaseAuth.instance;
//     _googleSignIn = GoogleSignIn(
//       scopes: <String>[
//         'email',
//       ],
//     );
//     _googleSignIn.onCurrentUserChanged
//         .listen((GoogleSignInAccount? account) async {
//       notifyListeners();
//       User _user = User(
//         id: account!.id,
//         email: account.email,
//         photoUrl: account.photoUrl,
//         displayName: account.displayName,
//       );

//       await CustomSharedPreferences.setString(
//           USER, jsonEncode(_user).toString());
//       Navigator.pushNamed(context, ROUTES.HOME);
//     });
//     _googleSignIn.signInSilently();
//   }

//   // Form Validation
//   void validateForm() {
//     bool isFormValid = _isFormValid;
//     String name = this.nameController.value.text;
//     String phoneNo = this.phoneNoController.value.text;
//     if (name.trim() == "" || phoneNo.trim() == "") {
//       isFormValid = false;
//     } else {
//       isFormValid = true;
//     }
//     _isFormValid = isFormValid;
//     notifyListeners();
//   }

//   Future<void> handleSignIn() async {
//     try {
//       _isLoading = true;
//       await _googleSignIn.signIn().then(
//             (value) async => {
//               await CustomSharedPreferences.setString(USER, value.toString()),
//               await CustomSharedPreferences.setBool(IS_LOGGED_IN, true),
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(builder: (_) => HomeScreen()),
//                   (Route<dynamic> route) => false),
//               // Navigator.pushNamedAndRemoveUntil(
//               //     context, ROUTES.HOME, (Route<dynamic> route) => false),
//             },
//           );
//       _isLoading = false;
//     } catch (error) {
//       await CustomSharedPreferences.setBool(IS_LOGGED_IN, false);
//       print(error);
//       _isLoading = false;
//     }
//   }

//   // Emaill Authontication
//   Future<void> createAccountWithEmailAndPassword(email, password) async {
//     try {
//       // firebase.UserCredential userCredential =
//       await auth!
//           .createUserWithEmailAndPassword(email: email, password: password)
//           .then((value) async {
//         User _user = User(
//           id: value.user!.uid,
//           email: value.user!.email,
//           photoUrl: value.user!.photoURL,
//           displayName: value.user!.displayName,
//         );

//         await CustomSharedPreferences.setString(
//             USER, jsonEncode(_user).toString());
//         print("Account created");
//         Navigator.pushNamed(context, ROUTES.HOME);
//       });
//     } on firebase.FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         try {
//           // firebase.UserCredential userCredential =
//           await auth!
//               .signInWithEmailAndPassword(email: email, password: password)
//               .then((value) async {
//             User _user = User(
//               id: value.user!.uid,
//               email: value.user!.email,
//               photoUrl: value.user!.photoURL,
//               displayName: value.user!.displayName,
//             );
//             print("Account signed");
//             await CustomSharedPreferences.setString(
//                 USER, jsonEncode(_user).toString());
//           });
//           Navigator.pushNamed(context, ROUTES.HOME);
//         } on firebase.FirebaseAuthException catch (e) {
//           if (e.code == 'wrong-password') {
//             print('Wrong password provided for that user.');
//           } else {
//             print(e.code.toString());
//           }
//         }
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   // Phone Auth

//   //Loading
//   showLoading(message, mainContext) {
//     showDialog(
//       context: mainContext,
//       builder: (context) {
//         dialogContext = context;
//         return Material(
//           color: Colors.transparent,
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(message),
//                     CupertinoActivityIndicator(),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   handleSignOut() async {
//     _googleSignIn.disconnect();
//     await firebase.FirebaseAuth.instance.signOut();
//   }
// }
