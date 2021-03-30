// import 'dart:async';
// import 'package:pigeon/constants.dart';
// import 'package:pigeon/src/data/models/user.dart';
// import 'package:pigeon/src/screens/home/home_view.dart';
// import 'package:pigeon/src/utils/custom_shared_preferences.dart';
// import 'package:pigeon/src/utils/state_control.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart' as auth;
// import 'package:pigeon/src/widgets/alert_box.dart';

// class OTPController extends StateControl {
//   final BuildContext context;

//   User myUser;

//   TextEditingController otpController = TextEditingController();

//   bool _isFormValid = false;
//   String _verificationId;
//   get isFormValid => _isFormValid;

//   OTPController({
//     @required this.context,
//   }) {
//     this.init();
//   }

//   void init() async {
//     await getMyUser();
//     this.otpController.addListener(this.validateForm);
//   }

//   getMyUser() async {
//     myUser = await CustomSharedPreferences.getMyUser();
//     notifyListeners();
//     await sendCode();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     this.otpController.dispose();
//   }

//   Future sendCode() async {
//     showLoading("Sending OTP...", context);
//     String phone = myUser.phone;

//     try {
//       await auth.FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: '+91' + phone,
//         verificationCompleted: (auth.AuthCredential phoneAuthCredential) =>
//             print('Sign up with phone complete'),
//         verificationFailed: (error) {
//           Navigator.of(dialogContext).pop();
//           print('error message is ${error.message}');
//           showAlertDialog("Unable to send OTP, please try again", context);
//         },
//         codeSent: (String verificationId, [int forceResendingToken]) {
//           Navigator.of(dialogContext).pop();
//           print('verificationId is $verificationId');
//           _verificationId = verificationId;
//         },
//         timeout: const Duration(seconds: 60),
//         codeAutoRetrievalTimeout: (String verificationId) {},
//       );
//     } catch (e) {
//       print(e);
//     }
//   }

//   BuildContext dialogContext;
//   void submitForm() async {
//     showLoading("One moment please...", context);
//     String otp = this.otpController.value.text;
//     try {
//       auth.PhoneAuthCredential phoneAuthCredential =
//           auth.PhoneAuthProvider.credential(
//               verificationId: _verificationId, smsCode: otp.substring(0, 6));
//       dynamic _authResult = await auth.FirebaseAuth.instance
//           .signInWithCredential(phoneAuthCredential);
//       auth.User user = _authResult.user;
//       if (user != null) {
//         FocusScope.of(context).requestFocus(FocusNode());
//         await CustomSharedPreferences.setBool('otpVerified', true);
//         _verificationId = null;
//         Navigator.of(context)
//             .pushNamedAndRemoveUntil(HomeScreen.routeName, (_) => false);
//       } else {
//         Navigator.of(dialogContext).pop();
//         showAlertDialog("Wrong OTP", context);
//         print(':else wrong OTP');
//       }
//     } catch (e) {
//       FocusScope.of(context).requestFocus(FocusNode());
//       Navigator.of(dialogContext).pop();
//       showAlertDialog("Wrong OTP", context);
//       print('catch : wrong OTP');
//       print(e);
//     }
//   }

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

//   void validateForm() {
//     bool isFormValid = _isFormValid;
//     String otp = this.otpController.value.text;
//     if (otp.trim() == "" && otp.length == 6) {
//       isFormValid = false;
//     } else {
//       isFormValid = true;
//     }
//     _isFormValid = isFormValid;
//     notifyListeners();
//   }
// }
