import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solution_challenge/config/assets.dart';
import 'package:solution_challenge/config/constant.dart';
import 'package:solution_challenge/data/models/symptoms.dart';

class EnterSymptoms extends StatefulWidget {
  @override
  _EnterSymptomsState createState() => _EnterSymptomsState();
}

class _EnterSymptomsState extends State<EnterSymptoms> {
  bool isHavingData = false;
  bool hide = false;
  TextEditingController _textEditingController;
  List<Symptoms> symptoms = [
    Symptoms(name: "fever"),
    Symptoms(name: "cold"),
    Symptoms(name: "flu"),
    Symptoms(name: "cough"),
    Symptoms(name: "cold blood"),
  ];
  List<Symptoms> _searchResult = [];
  @override
  void initState() {
    _textEditingController = TextEditingController();
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
        title: Hero(
          tag: "logo",
          child: Image.asset(
            Assets.klogo,
            scale: 36,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Hero(
          tag: "box",
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
              GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  setState(() {
                    hide = false;
                  });
                },
                child: Container(
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
                              !hide ? "Welcome to the Dreave." : "",
                              style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Enter your symptoms.",
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
                        child: TextField(
                          onTap: () {
                            setState(() {
                              hide = true;
                              isHavingData = true;
                            });
                          },
                          controller: _textEditingController,
                          onChanged: (value) {
                            onSearchTextChanged(value);
                          },
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
                            hintText: "symptom1, symptoms2, ...",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Min. 3 required",
                          ),
                        ],
                      ),
                      !isHavingData
                          ? Expanded(
                              flex: 5,
                              child: Image.asset(
                                Assets.kSearchSymptoms,
                              ),
                            )
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: _searchResult.length != 0 ||
                                            _searchResult.isNotEmpty
                                        ? List.generate(
                                            _searchResult.length,
                                            (index) => GestureDetector(
                                              onTap: () {
                                                print(
                                                    _searchResult[index].name);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 26,
                                                    vertical: 16),
                                                child: Text(
                                                  "# ${_searchResult[index].name}",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          )
                                        : List.generate(
                                            symptoms.length,
                                            (index) => GestureDetector(
                                              onTap: () {
                                                print(symptoms[index].name);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 26,
                                                    vertical: 16),
                                                child: Text(
                                                  "# ${symptoms[index].name}",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                      // Expanded(
                      //   flex: 1,
                      //   child:
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xffD1E7F8),
        height: 80,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ROUTES.COMMUNITY_DES,
                arguments: [_textEditingController.text]);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    symptoms.forEach((s) {
      if (s.name.contains(text) || s.name.contains(text)) _searchResult.add(s);
    });

    setState(() {});
  }
}
