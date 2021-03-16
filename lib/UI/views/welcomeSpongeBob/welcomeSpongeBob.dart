import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solution_challenge/config/assets.dart';

class WelcomeSpongeBob extends StatefulWidget {
  @override
  _WelcomeSpongeBob createState() => _WelcomeSpongeBob();
}

class _WelcomeSpongeBob extends State<WelcomeSpongeBob> {
  bool isHavingData = true;
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
              Expanded(
                flex:2,
                              child: Text(
                  "Welcome,\nSpongebob",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              Expanded(
                flex:7,
                child: Image.asset(
                  Assets.kSponge,
                  scale: 1.3,
                ),
              ),
              
              Expanded(
                flex:1,
                              child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal:26.0, vertical:2.0
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                decoration: BoxDecoration(
                                  color: Color(0xff50D18D),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                  "GO TO HOMESCREEN",
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
