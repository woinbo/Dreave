import 'dart:convert';
import 'package:donor_app/Models/logHistory.dart';
import 'package:donor_app/config/assetCatalog.dart';
import 'package:donor_app/config/configuration.dart';
import 'package:donor_app/donorSearch/donorSearch.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
//import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// Properties
bool _shakeFeatureEnable = false;
bool _isDrawerOpen = false;
bool _lightAnimation = false;
bool _isSecondDrawerOpen = false;
var data;
Offset _offsetValueOrigin = Offset(0, 0);
Offset _offsetValueSlide = Offset(0, 40);
Offset _offset = Offset(0, 0);
Offset _offsetSecondCard = Offset(0, 0);

class _HomeScreenState extends State<HomeScreen> {
  //SAMPLE LOG HISTORY AND TO BE CHANGED BY THE FIRESTORE DATABASE

  List<UserLogHistory> userhistory = [
    UserLogHistory("Spongebob", "23-02-2021", 1.4, "12:30 PM",
        "https://certificate.link", true, false, false),
    UserLogHistory("Camella", "21-02-2021", 2.3, "2:30 PM",
        "https://certificate.link", false, false, false),
    UserLogHistory("Bob", "23-02-2021", 1.4, "12:30 PM",
        "https://certificate.link", true, false, true),
    UserLogHistory("Carmel", "20-02-2021", 3.4, "1:30 PM",
        "https://certificate.link", false, false, true),
    UserLogHistory("Railee", "19-02-2021", 1.4, "12:30 PM",
        "https://certificate.link", false, true, false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // App Bar
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 5),
          child: Image.asset(
            Assets.logo,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Dreave',
          style: dreaveTextStyle,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                _lightAnimation = !_lightAnimation;
              });
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 10, top: 5, left: 5, bottom: 5),
              child: Lottie.asset(Assets.postLight,
                  animate: _lightAnimation, height: 20.0, repeat: false),
            ),
          ),
        ],
        elevation: 0.2,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
      ),

      body: ListView(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                height: 30,
              )),
          Expanded(
            flex: 3,
            child: Stack(
              fit: StackFit.loose,
              children: [
                // The Deck Container
                Transform.translate(
                  offset: _offset,
                  child: Container(
                      height: 250,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.only(left: 20, bottom: 10, right: 10),
                      decoration: BoxDecoration(
                        color: deckBlue,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10.0,
                              spreadRadius: 5.0,
                              offset: Offset(0, 0),
                              color: Colors.black12.withOpacity(0.1)),
                        ],
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: (Row(
                          children: [
                            Text(
                              'Attention: ',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              'The important messages will appear here.',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )
                          ],
                        )),
                      )),
                ),
                // The Front Card Container
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isDrawerOpen = !_isDrawerOpen;
                      _offset = _isDrawerOpen
                          ? _offsetValueSlide
                          : _offsetValueOrigin;
                    });
                  },
                  child: Container(
                    height: 250,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.only(top: 35, left: 30, right: 40),
                    decoration: BoxDecoration(
                      color: cardBlue,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: Offset(3, 8),
                          color: Colors.black.withOpacity(0.02),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Good Morning',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Text(
                          'Spongebob Sq.',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          'WED 15 MARCH,2021',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff1E257B)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              margin: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff333333),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 7,
                                        spreadRadius: 5,
                                        color: Colors.black.withOpacity(0.25))
                                  ]),
                              child: Center(
                                child: Text('B+',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff31A0DA))),
                              ),
                            ),
                            Text('30 °C',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                // ERROR CAUSING ELEMENT
                // Positioned(
                //   child: Center(
                //     child: Image.asset(
                //       Assets.sunIcon,
                //       scale: 2.8,
                //     ),
                //   ),
                //   top: -90,
                //   right: -10,
                // )
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                height: 50,
                color: Colors.transparent,
              )),
          // THE SECOND CARD DECK OF REQUEST
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                // The Back Container
                Transform.translate(
                  offset: _offsetSecondCard,
                  child: Container(
                      height: 250,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.only(left: 20, bottom: 10, right: 10),
                      decoration: BoxDecoration(
                        color: deckBlue,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10.0,
                              spreadRadius: 5.0,
                              offset: Offset(0, 0),
                              color: Colors.black12.withOpacity(0.1)),
                        ],
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: (Row(
                          children: [
                            Text(
                              'You dont have any pending requests',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        )),
                      )),
                ),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSecondDrawerOpen = !_isSecondDrawerOpen;
                      _offsetSecondCard = _isSecondDrawerOpen
                          ? _offsetValueSlide
                          : _offsetValueOrigin;
                    });
                  },
                  child: Container(
                    height: 250,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.only(top: 25, left: 30, right: 40),
                    decoration: BoxDecoration(
                      color: cardBlue,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: Offset(3, 8),
                          color: Colors.black.withOpacity(0.02),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Pending Requests',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Container(
                          child: Image.asset(
                            Assets.noRequest,
                            height: 180,
                            width: 210,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              height: 50,
              color: Colors.transparent,
            ),
          ),

          // The Log History Card
          Expanded(
            flex: 4,
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(top: 25, left: 30, right: 40),
              decoration: BoxDecoration(
                color: cardBlue,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                    offset: Offset(3, 8),
                    color: Colors.black.withOpacity(0.02),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Logs History',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Container(
                    height: 40,
                  ),
                  Center(
                      child: ListView.builder(
                    itemCount: userhistory.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(userhistory[index].requestorName),
                                Text(userhistory[index].dateRequested)
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  )),
                  Container(
                    height: 40,
                  ),
                  Container(
                    child: Image.asset(
                      Assets.logHistory,
                      height: 180,
                      width: 210,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),

      // Floating Action Buttons
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {
                  // TODO
                },
                backgroundColor: _shakeFeatureEnable
                    ? Color.fromRGBO(71, 123, 46, 1)
                    : Color.fromRGBO(65, 65, 65, 1),
                elevation: 0.8,
                child: Image.asset(
                  Assets.shakeIcon,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DonorSearch()),
              );
            },
            backgroundColor: Color.fromRGBO(255, 0, 0, 1),
            elevation: 0.8,
            child: Center(
              child: Image.asset(
                Assets.emergencyIcon,
                scale: 0.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
