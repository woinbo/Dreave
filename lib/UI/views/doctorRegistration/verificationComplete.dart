import 'package:flutter/material.dart';
import 'package:solution_challenge/config/assets.dart';
import 'package:solution_challenge/config/constant.dart';

class VerificationComplete extends StatefulWidget {
  @override
  _VerificationComplete createState() => _VerificationComplete();
}

class _VerificationComplete extends State<VerificationComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Image.asset(
          Assets.kBackIcon,
          scale: 5,
        ),
        title: Image.asset(
          Assets.klogo,
          scale: 36,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(0xff007AD9).withOpacity(0.18),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  "Verify your Identity",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Image.asset(
                        Assets.kdocUploaded,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: RichText(
                        text: TextSpan(
                          text: 'UPLOADED SUCCESFULLY\n',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  "NOTE: We are reviewing you identity after succesfully \nindentification you will be alloted doctor badge",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ROUTES.HOME);
                  },
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 42.0),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                    decoration: BoxDecoration(
                      color: Color(0xff2AA4F4),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "CONTINUE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
