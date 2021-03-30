import 'package:flutter/material.dart';
import 'package:solution_challenge/config/assets.dart';
import 'package:solution_challenge/config/constant.dart';
import 'package:solution_challenge/data/models/community.dart';

class CommunityDescription extends StatefulWidget {
  final List<String> tag;

  const CommunityDescription({Key key, @required this.tag}) : super(key: key);

  @override
  _CommunityDescriptionState createState() => _CommunityDescriptionState();
}

class _CommunityDescriptionState extends State<CommunityDescription> {
  ScrollController _scrollController;
  List<Community> _searchResult = [];
  // Community _community = Community();
  searchRelatedCom(List<String> text) async {
    print(text);
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    community.forEach((s) {
      if (s.tag.contains(text[0])) _searchResult.add(s);
    });

    setState(() {});
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    searchRelatedCom(widget.tag);
    super.initState();
  }

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
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7.0)),
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: RichText(
                          text: TextSpan(
                              text: "${_searchResult[0].name}\n\n",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(text: "Symptoms\n\n"),
                                TextSpan(
                                    text: "${_searchResult[0].symptoms}\n\n"),
                                TextSpan(text: "Treatment\n\n"),
                                TextSpan(
                                    text: "${_searchResult[0].treatment}\n"),
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 24),
                              decoration: BoxDecoration(
                                color: Color(0xff2AA4F4),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Go Back",
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
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ROUTES.COMMUNICATION_REGISTRATION);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 24),
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
          ],
        ),
      ),
    );
  }
}
