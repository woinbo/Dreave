import 'package:flutter/material.dart';
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
                      child: Image.asset(Assets.logo),
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
                  padding: EdgeInsets.symmetric(horizontal: 36, vertical: 36),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome to the\nCommunity.",
                            style: TextStyle(
                              fontSize: 31,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "You are not Alone",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Form(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: TextFormField(
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                      ),
                                      labelText: "Search..",
                                      hintText: "Search..",
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                !isHavingData
                                    ? Text(
                                        "Search || connect || communcate",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      )
                                    : Expanded(
                                        flex: 5,
                                        child: SingleChildScrollView(
                                          child: ListView(
                                            children: List.generate(
                                                5,
                                                (index) => ListTile(
                                                      leading: CircleAvatar(
                                                        backgroundImage:
                                                            AssetImage(Assets
                                                                .googleIcon),
                                                      ),
                                                    )),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
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
                            "CONTINUE",
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
