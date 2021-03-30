import 'dart:ui';

import 'package:donor_app/config/assetCatalog.dart';
import 'package:donor_app/config/configuration.dart';
import 'package:donor_app/donorHomeScreen/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AfterSplash extends StatefulWidget {
  @override
  _AfterSplashState createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 30),
        child: Center(
          child: Column(
            children: [
              Stack(children: [
                Center(
                  child: Container(
                    child: Column(
                      children: [
                        Image.asset(
                          Assets.logo,
                          scale: 1.3,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Dreave',
                          style: dreaveTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Image.asset(
                    Assets.afterSplash,
                    scale: 1,
                  ),
                ),
              ]),
              Text(
                'Welcome Donor',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Donor || Donate || Save Lives',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Color.fromRGBO(0, 0, 0, 0.6),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.0),
                child: Container(
                  height: 2.0,
                  color: Color.fromRGBO(36, 85, 239, 1),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(42, 164, 244, 1),
                        borderRadius: BorderRadiusDirectional.circular(30)),
                    height: 50,
                    width: 250,
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto'),
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
