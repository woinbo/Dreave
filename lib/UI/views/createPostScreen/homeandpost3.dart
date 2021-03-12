import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solution_challenge/config/assets.dart';

class Homeandpost3 extends StatefulWidget {
  @override
  _Homeandpost3 createState() => _Homeandpost3();
}

class _Homeandpost3 extends State<Homeandpost3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Image.asset(
          Assets.backIcon,
          scale: 1.5,
        ),
        actions: [
          SvgPicture.asset("assets/icons/share.svg"),
          SvgPicture.asset("assets/icons/donate.svg"),
        ],
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Text(
                        "#Achalasia",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(36.0),
                      topLeft: Radius.circular(36.0),
                    ),
                    color: Color(0xffD1E7F8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 36),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Create your Own",
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Connect with your Community.",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/images/person.svg",
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 80, vertical: 16),
                          decoration: BoxDecoration(
                            color: Color(0xff2AA4F4),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                          ),
                          child: Text(
                            "GO BACK",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
