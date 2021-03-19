import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solution_challenge/config/assets.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreen createState() => _PostScreen();
}

class Info {
  String name;
  IconData disease;
  String image;
  String day;
  String content;

  Info({this.name, this.disease, this.image, this.day, this.content});
}

class _PostScreen extends State<PostScreen> {
  ScrollController scrollController;
  List<Info> request = [
    Info(
        name: "Mr.Smurf",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMbNriDjzGBp3-ENUbLgdGr3KPE5N1sSnTsQ&usqp=CAU",
        disease: Icons.more_vert,
        day: "8 May",
        content:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."),
    Info(
        name: "Mr.Smurf",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMbNriDjzGBp3-ENUbLgdGr3KPE5N1sSnTsQ&usqp=CAU",
        disease: Icons.more_vert,
        day: "8 May",
        content:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."),
    Info(
        name: "Mr.Smurf",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMbNriDjzGBp3-ENUbLgdGr3KPE5N1sSnTsQ&usqp=CAU",
        disease: Icons.more_vert,
        day: "8 May",
        content:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.")
  ];
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Image.asset(
          Assets.kBackIcon,
          scale: 1.5,
        ),
        title: Image.asset(
          Assets.klogo,
          scale: 36,
        ),
        actions: [
          SvgPicture.asset("assets/icons/share.svg", height: 35, width: 35),
          SvgPicture.asset("assets/icons/donate.svg", height: 35, width: 35),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Scrollbar(
                child: ListView.builder(
                  reverse: false,
                  controller: scrollController,
                  itemCount: request.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 16.0,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 16.0,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Color(0xff007AD9),
                            width: 1,
                          ),
                          color: Color(0xffFFFFFF)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                child: Image.network(request[index].image),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "MR ANKIT",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Aaj ka din",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.more_vert,
                              )
                            ],
                          ),
                          Text(
                            request[index].content,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Read More",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 65,
        decoration: BoxDecoration(
            color: Color(0xff2AA4F4).withOpacity(0.2),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home_outlined, color: Color(0xff2AA4F4)),
              onPressed: null,
              iconSize: 40,
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.telegramPlane,
                  color: Color(0xff2AA4F4)),
              onPressed: null,
              iconSize: 32,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff155CDE),
        child: Icon(FontAwesomeIcons.plus, color: Color(0xffFFFFFF)),
        onPressed: null,
      ),
    );
  }
}
