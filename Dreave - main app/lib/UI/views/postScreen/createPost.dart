import 'package:flutter/material.dart';
import 'package:solution_challenge/config/assets.dart';
import 'package:solution_challenge/config/constant.dart';

class CreatePost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Share Experience!",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Thank you for helping humanity!",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.65),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 7,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7.0)),
                      child: TextField(
                        maxLines: 50,
                        onTap: () {},
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Write down your experience....",
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Image.asset(Assets.kMedicineLeaf),
                              onPressed: null,
                            ),
                            IconButton(
                              icon: Image.asset(Assets.kHerbal),
                              onPressed: null,
                            ),
                            IconButton(
                              icon: Image.asset(Assets.kNonne),
                              onPressed: null,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Image.asset(Assets.kImage),
                              onPressed: null,
                            ),
                            IconButton(
                              icon: Image.asset(Assets.kPinDoc),
                              onPressed: null,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, ROUTES.COMMUNICATION_REGISTRATION);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(0xff2AA4F4),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "POST",
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
      ),
    );
  }
}
