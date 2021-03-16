import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solution_challenge/UI/views/createPostScreen/homeandpost3.dart';
import 'package:solution_challenge/UI/views/userPermission/internetConnection.dart';
import 'package:solution_challenge/UI/views/userPermission/permissionNeeded.dart';
import 'package:solution_challenge/UI/views/verifyMobileScreen/verifyYourIdentity.dart';
import 'package:solution_challenge/UI/views/welcomeSpongeBob/welcomeSpongeBob.dart';
// import 'package:solution_challenge/UI/views/authScreen/authController.dart';
import 'package:solution_challenge/UI/widgets/divider.dart';
import 'package:solution_challenge/config/assets.dart';
import 'package:solution_challenge/config/constant.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // late AuthController _authController;
  TextEditingController _emailContoller;
  TextEditingController _passwordContoller;
  TextEditingController _otpContoller;

  @override
  void initState() {
    _emailContoller = TextEditingController();
    _passwordContoller = TextEditingController();
    _otpContoller = TextEditingController();

    // _authController = AuthController(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(
                Assets.logo,
                scale: 16,
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "Welcome to the Dreave.\n",
                              style: TextStyle(
                                fontSize: 31,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: "Connect with rare people.",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Form(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: TextFormField(
                                controller: _emailContoller,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                  labelText: "Phone or Email",
                                  hintText: "Phone or Email",
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TextFormField(
                                obscureText: true,
                                controller: _passwordContoller,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                  labelText: "Password",
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                  ),
                                  suffixIcon: Icon(FontAwesomeIcons.eye),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TextFormField(
                                obscureText: false,
                                controller: _otpContoller,
                                onEditingComplete: () {
                                  // _authController.smsCode(_otpContoller.text);
                                },
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                  labelText: "OTP",
                                  hintText: "OTP",
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                  ),
                                  suffixIcon: Icon(FontAwesomeIcons.eye),
                                ),
                              ),
                            ),
                            divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  icon: Image.asset(
                                    Assets.googleIcon,
                                  ),
                                  onPressed: () {
                                    // _authController.handleSignIn();
                                  },
                                ),
                                IconButton(
                                  icon: Image.asset(
                                    Assets.facebookIcon,
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, ROUTES.CREATE_POST_SCREEN);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff2455EF),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * 10 / 10,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0),
                      ),
                      color: Color(0xffD1E7F8),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          //   if (_emailContoller.text == "8445377229") {
                          //     _authController.phoneAuth(_emailContoller.text);
                          //   } else
                          //     _authController.createAccountWithEmailAndPassword(
                          //         _emailContoller.text, _passwordContoller.text);
<<<<<<< HEAD
                          //Navigator.pushNamedAndRemoveUntil(
                            //  context, ROUTES.SEARCH_COMM, (route) => false);
                            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  WelcomeSpongeBob()),
  );
=======
                          Navigator.pushNamedAndRemoveUntil(
                              context, ROUTES.SEARCH_COMM, (route) => false);
>>>>>>> 7ae96638772906ac7f317b0884b268d7420841b4
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            color: Color(0xff2AA4F4),
                          ),
                          child: Center(
                            child: Text(
                              "DONE",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        // ],
      ),
    );
    // ),
    // ),
    // );
  }
}
