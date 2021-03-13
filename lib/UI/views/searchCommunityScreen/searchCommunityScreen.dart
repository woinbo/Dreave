import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solution_challenge/config/assets.dart';

class SearchCommunityScreen extends StatefulWidget {
  @override
  _SearchCommunityScreenState createState() => _SearchCommunityScreenState();
}

class _SearchCommunityScreenState extends State<SearchCommunityScreen> {
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
              Text(
                "Welcome to the Community.",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "You are not alone!",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black.withOpacity(0.65),
                ),
              ),
              TextField(
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
              Image.asset(
                Assets.search_,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPageIndicator({
    int? slideIndex,
    int? index,
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
                color: index! <= slideIndex!
                    ? Color(0xff2455EF)
                    : Color(0xffBDCCFA),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
