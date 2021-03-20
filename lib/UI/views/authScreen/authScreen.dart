import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:pinput/pin_put/pin_put.dart';
// import 'package:solution_challenge/UI/views/authScreen/authController.dart';
import 'package:solution_challenge/UI/widgets/divider.dart';
import 'package:solution_challenge/UI/widgets/textEditingField.dart';
import 'package:solution_challenge/config/assets.dart';
import 'package:solution_challenge/config/constant.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  // late AuthController _authController;
  TextEditingController _nameContoller;
  TextEditingController _phoneOrEmailContoller;
  TextEditingController _passwordOrOtpContoller;
  TabController _tabController;
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  void initState() {
    _nameContoller = TextEditingController();
    _phoneOrEmailContoller = TextEditingController();
    _passwordOrOtpContoller = TextEditingController();
    _tabController = TabController(length: 2, vsync: this);
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
                Assets.klogo,
                scale: 16,
              ),
            ),
            Expanded(
              flex: _tabController.index == 1 ? 10 : 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 2),
                            child: _tabController.index == 0
                                ? RichText(
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
                                            color:
                                                Colors.black.withOpacity(0.65),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : RichText(
                                    text: TextSpan(
                                      text: "Verify you phone no.\n",
                                      style: TextStyle(
                                        fontSize: 31,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Enter the OTP received",
                                          style: TextStyle(
                                            fontSize: 25,
                                            color:
                                                Colors.black.withOpacity(0.65),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: _tabController.index == 1 ? 6 : 3,
                      child: TabBarView(
                        controller: _tabController,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Form(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: TextFormField(
                                    controller: _nameContoller,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                      ),
                                      labelText: "Name",
                                      hintText: "Name",
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: TextEditingField(
                                    passwordContoller: _phoneOrEmailContoller,
                                    fieldStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    labelText: "Email or Phone",
                                    hintText: "Email or Phone",
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                MediaQuery.of(context).viewInsets.bottom == 0
                                    ? divider()
                                    : Container(),
                                MediaQuery.of(context).viewInsets.bottom == 0
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                            icon: Image.asset(
                                              Assets.kGoogleIcon,
                                            ),
                                            onPressed: () {
                                              // _authController.handleSignIn();
                                            },
                                          ),
                                          IconButton(
                                            icon: Image.asset(
                                              Assets.kFacebookIcon,
                                            ),
                                            onPressed: () {
                                              Navigator.pushNamed(context,
                                                  ROUTES.CREATE_POST_SCREEN);
                                            },
                                          ),
                                        ],
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                          Form(
                            child: Column(
                              children: [
                                Container(
                                  width: 240,
                                  child: PinPut(
                                    fieldsCount: 4,
                                    // onSubmit: (String pin) => print(pin),
                                    focusNode: _pinPutFocusNode,
                                    useNativeKeyboard: false,
                                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                                    withCursor: true,
                                    controller: _passwordOrOtpContoller,
                                    submittedFieldDecoration:
                                        _pinPutDecoration.copyWith(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    selectedFieldDecoration: _pinPutDecoration,
                                    followingFieldDecoration:
                                        _pinPutDecoration.copyWith(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                        color: Colors.deepPurpleAccent
                                            .withOpacity(.5),
                                      ),
                                    ),
                                  ),
                                ),
                                NumericKeyboard(
                                  onKeyboardTap: (value) {
                                    _passwordOrOtpContoller.text =
                                        _passwordOrOtpContoller.text + value;
                                  }, //_onKeyboardTap,
                                  textColor: Colors.black,
                                  rightIcon: Icon(
                                    Icons.backspace,
                                    color: Colors.black,
                                  ),
                                  rightButtonFn: () {
                                    _passwordOrOtpContoller.text =
                                        _passwordOrOtpContoller.text.substring(
                                            0,
                                            _passwordOrOtpContoller
                                                    .text.length -
                                                1);
                                  },
                                  leftButtonFn: () {
                                    print('left button clicked');
                                  },
                                  leftIcon: Icon(
                                    Icons.check,
                                    color: Colors.black,
                                  ),

                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                )
                              ],
                            ),
                          ),
                        ],
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
                    child: AnimatedContainer(
                      duration: Duration(seconds: 3),
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
                      width: _tabController.index == 1
                          ? MediaQuery.of(context).size.width * 10 / 10
                          : MediaQuery.of(context).size.width * 5.8 / 10,
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
                          //   if (_nameContoller.text == "8445377229") {
                          //     _authController.phoneAuth(_nameContoller.text);
                          //   } else
                          //     _authController.createAccountWithEmailAndPassword(
                          //         _nameContoller.text, _passwordContoller.text);
                          setState(() {
                            _tabController.index == 1
                                ? Navigator.pushNamed(context, ROUTES.ENTER_SYM)
                                : _tabController.animateTo(1);
                          });
                        },
                        child: Container(
                          margin: MediaQuery.of(context).viewInsets.bottom == 0
                              ? EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 30)
                              : EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            color: Color(0xff2AA4F4),
                          ),
                          child: Center(
                            child: Text(
                              _tabController.index == 1 ? "VERIFY" : "NEXT >>",
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
      ),
    );
  }

  @override
  void dispose() {
    _nameContoller.dispose();
    _phoneOrEmailContoller.dispose();
    _passwordOrOtpContoller.dispose();
    _tabController.dispose();
    super.dispose();
  }
}
