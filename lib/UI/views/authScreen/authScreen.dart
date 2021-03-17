import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solution_challenge/UI/views/createPostScreen/homeandpost3.dart';
import 'package:solution_challenge/UI/views/userPermission/internetConnection.dart';
import 'package:solution_challenge/UI/views/userPermission/permissionNeeded.dart';
import 'package:solution_challenge/UI/views/verifyMobileScreen/verifyYourIdentity.dart';
// import 'package:solution_challenge/UI/views/authScreen/authController.dart';
import 'package:solution_challenge/UI/widgets/divider.dart';
import 'package:solution_challenge/config/assets.dart';
import 'package:solution_challenge/config/constant.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // late AuthController _authController;
  late TextEditingController _emailContoller;
  late TextEditingController _passwordContoller;
  late TextEditingController _otpContoller;

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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: IntrinsicHeight(
          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    Assets.logo,
                    scale: 26,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Welcome to the\nCommunity.",
                          style: TextStyle(
                            fontSize: 31,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Connect with people.",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Form(
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
                            ],
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
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(70.0),
                        topLeft: Radius.circular(70.0),
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
                          //Navigator.pushNamedAndRemoveUntil(
                            //  context, ROUTES.SEARCH_COMM, (route) => false);
                            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  VerifyYourIdenity()),
  );
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
                          )),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
