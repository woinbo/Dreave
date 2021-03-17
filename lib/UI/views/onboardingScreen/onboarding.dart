// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solution_challenge/UI/views/authScreen/authScreen.dart';
import 'package:solution_challenge/config/assets.dart';
import 'package:solution_challenge/config/constant.dart';
import 'package:solution_challenge/utils/custom_shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller;
  List<_SliderModel> mySlides = <_SliderModel>[
    _SliderModel(
      imageAssetPath: Image.asset(
        Assets.search,
        scale: 1,
      ),
      title: 'Search',
      desc: 'Search for the community **',
    ),
    _SliderModel(
      imageAssetPath: Image.asset(Assets.communicate),
      title: 'Join Commnunity',
      desc: 'You are ready to get started \nwith the community',
    ),
    _SliderModel(
      imageAssetPath: Image.asset(Assets.connect),
      title: 'Connect with people',
      desc: 'Connect with the community **',
    ),
  ];

  List pageIndicatorColorList = [
    Colors.green,
    Colors.blue,
    Colors.red,
  ];

  int slideIndex = 0;
  @override
  void initState() {
    controller = PageController();
    // autoSlide();
    super.initState();
  }

  // int? _slideIndex = 0;

  // autoSlide() async {
  //   Timer(Duration(seconds: 3), () {
  //     setState(() {
  //       slideIndex = slideIndex! + 1;
  //       controller!.animateToPage(mySlides!.length - slideIndex!,
  //           duration: Duration(milliseconds: 400), curve: Curves.linear);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (controller.hasClients) {
                        controller.animateToPage(mySlides.length - 1,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInExpo);
                      }
                    },
                    child: Text(
                      'Log In >>',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: PageView.builder(
                itemCount: mySlides.length,
                controller: controller,
                onPageChanged: (index) {
                  setState(
                    () {
                      slideIndex = index;
                    },
                  );
                },
                itemBuilder: (_, index) => _SlideTile(
                  image: mySlides[index].imageAssetPath,
                  title: mySlides[index].title,
                  desc: mySlides[index].desc,
                  isFirst: true,
                  titleStye: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                  descStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < mySlides.length; i++,)
                        i == slideIndex
                            ? buildPageIndicator(
                                slideIndex: slideIndex,
                                index: i,
                              )
                            : buildPageIndicator(
                                slideIndex: slideIndex,
                                index: i,
                              ),
                    ],
                  ),
                  slideIndex != mySlides.length - 1
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  children: [
                                    for (int i = 0; i < mySlides.length; i++,)
                                      i == slideIndex
                                          ? smallBuildPageIndicator(
                                              slideIndex: slideIndex,
                                              index: i,
                                            )
                                          : smallBuildPageIndicator(
                                              slideIndex: slideIndex,
                                              index: i,
                                            ),
                                  ],
                                ),
                              ),
                              Image.asset(
                                Assets.logo,
                                scale: 26,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  right: 12,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    if (controller.hasClients)
                                      controller.animateToPage(slideIndex + 1,
                                          duration: Duration(milliseconds: 200),
                                          curve: Curves.easeIn);
                                  },
                                  style: TextButton.styleFrom(
                                    primary: Color(0xff5222D0),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  child: Text(
                                    "Next >>",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            CustomSharedPreferences.setBool(
                                IS_FIRST_TIME, false);

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => AuthScreen()),
                                (Route<dynamic> route) => false);
                            // Navigator.pushNamedAndRemoveUntil(context,
                            //     ROUTES.AUTH, (Route<dynamic> route) => false);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 28,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 40,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xff5222D0),
                              borderRadius: BorderRadius.all(
                                Radius.circular(70.0),
                              ),
                            ),
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
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
            margin: const EdgeInsets.only(left: 0.0, right: 0.0, bottom: 5.0),
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

Widget smallBuildPageIndicator({
  int slideIndex,
  int index,
}) {
  return Container(
    margin: const EdgeInsets.only(left: 1.0, right: 1.0, bottom: 0.0),
    height: slideIndex == index ? 4 : 3,
    width: slideIndex == index ? 20 : 3,
    decoration: BoxDecoration(
      color: index <= slideIndex ? Colors.black : Colors.black,
      borderRadius: BorderRadius.all(
        Radius.circular(
          70.0,
        ),
      ),
    ),
  );
}

class _SlideTile extends StatelessWidget {
  final Widget image;
  final String title, desc;
  final bool isFirst;
  final double minTitleFontSize;
  final TextStyle titleStye;
  final TextStyle descStyle;
  final double miniDescFontSize;

  const _SlideTile({
    this.image,
    this.title,
    this.desc,
    this.isFirst = false,
    this.minTitleFontSize,
    this.miniDescFontSize,
    this.titleStye,
    this.descStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            maxLines: 1,
            style: titleStye,
          ),
          Text(
            desc,
            maxLines: 1,
            style: descStyle,
          )
        ],
      ),
    );
  }
}

class _SliderModel {
  const _SliderModel({
    this.imageAssetPath,
    this.title = "title",
    this.desc = "Description",
    this.descStyle,
    this.titleStyle,
  });

  final Image imageAssetPath;
  final String title;
  final TextStyle titleStyle;
  final String desc;
  final TextStyle descStyle;
}
