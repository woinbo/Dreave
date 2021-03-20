import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:solution_challenge/config/assets.dart';
import 'package:solution_challenge/config/constant.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class Info {
  String name;
  IconData disease;
  String image;
  String day;
  String content;

  Info({this.name, this.disease, this.image, this.day, this.content});
}

class _HomeScreen extends State<HomeScreen> {
  ScrollController scrollController;
  List<Info> request = [
    Info(
        name: "Mr.Smurf",
        image: Assets.kAvatar,
        disease: Icons.more_vert,
        day: "8 May",
        content:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."),
    Info(
        name: "Mr.Smurf",
        image: Assets.kAvatar,
        disease: Icons.more_vert,
        day: "8 May",
        content:
            "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
    Info(
        name: "Mr.Smurf",
        image: Assets.kAvatar,
        disease: Icons.more_vert,
        day: "8 May",
        content:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.")
  ];

  List<String> postTitle = [
    "emergeny",
    "tranding",
    "latest",
    "last hour",
    "red blood",
    "black blood",
  ];
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        // leading: Image.asset(
        //   Assets.kBackIcon,
        //   scale: 36,
        // ),
        automaticallyImplyLeading: false,

        title: Text(
          "#Achalasia",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Image.asset(
            Assets.kDonate,
            scale: 4,
          ),
          Image.asset(
            Assets.kLogOut,
            scale: 4,
          ),
        ],
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: postTitle.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color(0xff155CDE),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                        child: Text(
                          postTitle[index],
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Scrollbar(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: request.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 16.0,
                            left: 16.0,
                            right: 16.0,
                            bottom: 32.0,
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
                                width: 0.6,
                              ),
                              color: Color(0xffFFFFFF)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    child: Image.asset(request[index].image),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            request[index].name,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            request[index].day,
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
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                request[index].content,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Read More",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 16,
                          child: Image.asset(
                            Assets.kMedicineLeaf,
                            scale: 3,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 52.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    LikeButton(
                                      size: 24,
                                      bubblesSize: 52,
                                      likeBuilder: (bool isLiked) {
                                        return Icon(
                                          isLiked
                                              ? FontAwesomeIcons.solidHeart
                                              : FontAwesomeIcons.heart,
                                          color: Colors.red,
                                          size: 18,
                                        );
                                      },
                                      likeCount: 665,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Image.asset(
                                      Assets.kShare,
                                      scale: 3.5,
                                    ),
                                  ],
                                ),
                                Text(
                                  "Report",
                                  style: TextStyle(
                                    color: Color(0xffFF0000),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
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
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.home_outlined,
                    color: Color(0xff2AA4F4),
                  ),
                  onPressed: null,
                  iconSize: 40,
                ),
                Hero(
                  tag: "activeButton",
                  child: Container(
                    height: 3,
                    width: 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Color(0xff2AA4F4),
                    ),
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.telegramPlane,
                  color: Color(0xff2AA4F4)),
              onPressed: () =>
                  Navigator.pushNamed(context, ROUTES.PENDING_CHAT),
              iconSize: 32,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff155CDE),
        child: Icon(
          Icons.add,
          size: 36,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, ROUTES.CREATE_POST);
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:solution_challenge/data/models/user.dart';
// import 'package:solution_challenge/utils/custom_shared_preferences.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   User _user;
//   @override
//   void initState() {
//     super.initState();
//     getUser();
//   }

//   getUser() async {
//     _user = await CustomSharedPreferences.getMyUser();
//     setState(() {});

//     print(_user.displayName);
//   }

//   Widget _buildBody() {
//     if (_user != null) {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           ListTile(
//             leading: CircleAvatar(
//               backgroundImage: NetworkImage(_user.photoUrl ??
//                   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDWrIiYIAdOLTJ5Ql5YtMUvL3y3kK0Vh5JXQ&usqp=CAU"),
//             ),
//             title: Text(_user.displayName ?? 'Ankit'),
//             subtitle: Text(_user.email),
//           ),
//           const Text("Signed in successfully."),
//           ElevatedButton(
//             child: const Text('SIGN OUT'),
//             onPressed: () {
//               print("Sign out");
//             },
//           ),
//         ],
//       );
//     } else {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           const Text("You are not currently signed in."),
//           ElevatedButton(
//             child: const Text('SIGN IN'),
//             onPressed: () {
//               print("Sign in");
//             },
//           ),
//         ],
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: _buildBody());
//   }
// }
