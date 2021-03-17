import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solution_challenge/config/assets.dart';
import 'package:solution_challenge/config/constant.dart';

class SearchCommunityScreen extends StatefulWidget {
  @override
  _SearchCommunityScreenState createState() => _SearchCommunityScreenState();
}

class _SearchCommunityScreenState extends State<SearchCommunityScreen> {
  bool isHavingData = false;
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
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff2455EF),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                width: MediaQuery.of(context).size.width * 1 / 6,
                height: 45,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffD1E7F8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome to the Dreave.",
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Search the Community.",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black.withOpacity(0.65),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7.0),
                                borderSide: BorderSide(
                                  width: 0.2,
                                  color: Color(0xffFAFAFA),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7.0),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 0.2,
                                ),
                              ),
                              fillColor: Color(0xffFAFAFA),
                              filled: true,
                              hintText: "Search",
                              hintStyle: TextStyle(
                                fontSize: 16,
                              ),
                              prefixIcon: Icon(
                                FontAwesomeIcons.hashtag,
                                size: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isHavingData = !isHavingData;
                              });
                            },
                            child: SvgPicture.asset(
                              "assets/icons/search_more.svg",
                              height: 36,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  !isHavingData
                      ? Expanded(
                          flex: 5,
                          child: Image.asset(
                            Assets.search_,
                          ))
                      : Expanded(
                          flex: 7,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 40),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 0.2),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                  10,
                                  (index) => Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 26, vertical: 16),
                                    child: Text(
                                      "# $index",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ROUTES.COMMUNITY_DES);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Color(0xff2AA4F4),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "CONTINUE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
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
          ],
        ),
      ),
    );
  }

  Widget buildPageIndicator({
    int slideIndex,
    int index,
  }) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0),
              height: 2.0,
              decoration: BoxDecoration(
                color:
                    index <= slideIndex ? Color(0xff2455EF) : Color(0xffBDCCFA),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
