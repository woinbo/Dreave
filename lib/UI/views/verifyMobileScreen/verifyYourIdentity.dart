import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solution_challenge/config/assets.dart';

class VerifyYourIdenity extends StatefulWidget {
  @override
  _VerifyYourIdenity createState() => _VerifyYourIdenity();
}

class _VerifyYourIdenity extends State<VerifyYourIdenity>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Image.asset(
          Assets.backIcon,
          scale: 1.5,
        ),
        title: Image.asset(
          Assets.logo,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Verify your \nIdentity",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              
              SizedBox(
                height:100,
              ),
              Image.asset(
                Assets.kVerify,
              ),
              SizedBox(
               height: 40
              ),
              Text(
                "UPLOADED SUCCESFULLY",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
              height: 123,   
              ),
              GestureDetector(
                             
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal:32.0, vertical:8.0
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 80, vertical: 16),
                              decoration: BoxDecoration(
                                color: Color(0xff2AA4F4),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                "Retry",
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
            ],
          ),
          
        ),
      ),
    );
  }

}
  