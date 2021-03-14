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
          scale: 1,
        ),
        actions: [

          SvgPicture.asset("assets/icons/share.svg",height: 50, width: 50),
          SvgPicture.asset("assets/icons/donate.svg",height: 50, width: 50),
        ],
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex:1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Text(
                        "#Achalasia",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 8,
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
                      Expanded(
                        flex:2,
                            child: Column(
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
                            
                            Text(
                              "Connect with your Community.",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      Expanded(
                        flex:4,
                      child:SvgPicture.asset(
                              "assets/images/person.svg",
                              
                            ),
                      ),
                      Expanded(
                        flex:1,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 90, vertical: 16),
                          decoration: BoxDecoration(
                            color: Color(0xff2AA4F4),
                            borderRadius: BorderRadius.all(
                              Radius.circular(36.0),
                            ),
                          ),
                          child: Text(
                            "GO BACK",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
