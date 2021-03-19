import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:solution_challenge/config/assets.dart';

class Chatting extends StatefulWidget {
  @override
  _Chatting createState() => _Chatting();
}

class Chat {
  String message;
  bool isme;
  Chat({this.message, this.isme});
}

class _Chatting extends State<Chatting> {
  ScrollController scrollController;
  TextEditingController textEditingController;

  List<Chat> chat = [
    Chat(message: "This is a sample chat between two users.", isme: false),
    Chat(message: "This is a sample chat between two users.", isme: true),
    Chat(message: "This is a sample chat between two users.", isme: false),
    Chat(message: "This is a sample chat between two users.", isme: true),
    Chat(message: "This is a sample chat between two users.", isme: false),
    Chat(message: "This is a sample chat between two users.", isme: true),
    Chat(message: "This is a sample chat between two users.", isme: false),
    Chat(message: "This is a sample chat between two users.", isme: true),
    Chat(message: "This is a sample chat between two users.", isme: false),
    Chat(message: "This is a sample chat between two users.", isme: true),
    Chat(message: "This is a sample chat between two users.", isme: false),
    Chat(message: "This is a sample chat between two users.", isme: true)
  ];
  @override
  void initState() {
    scrollController = ScrollController();
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Image.asset(
          Assets.klogo,
          scale: 1.5,
        ),
        title: Text("Mr. Benest"),
        actions: [
          IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: () {},
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
            child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 9,
              child: Scrollbar(
                child: ListView.builder(
                    reverse: false,
                    controller: scrollController,
                    itemCount: chat.length,
                    itemBuilder: (context, index) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 278),
                        child: Container(
                            margin: EdgeInsets.only(
                              left: chat[index].isme ? 60 : 10,
                              right: chat[index].isme ? 10 : 60,
                              top: 20,
                              bottom: 20,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 24),
                            decoration: BoxDecoration(
                                color: chat[index].isme
                                    ? Colors.blue
                                    : Color(0xffF3F3F3),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: chat[index].isme
                                      ? Radius.circular(20)
                                      : Radius.circular(8),
                                  bottomRight: chat[index].isme
                                      ? Radius.circular(8)
                                      : Radius.circular(20),
                                )),
                            child: new Center(
                              child: new Text(
                                chat[index].message,
                                style: TextStyle(
                                    color: chat[index].isme
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      );
                    }),
              ),
            ),
          ],
        )),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Color(0xff2AA4F4).withOpacity(0.2),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        padding: EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 16),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              prefixIcon: IconButton(
                icon: Icon(Icons.emoji_emotions_rounded),
                iconSize: 30,
                onPressed: null,
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.attach_file),
                iconSize: 30,
                onPressed: () {
                  chat.add(
                      Chat(message: textEditingController.text, isme: true));
                  setState(() {
                    scrollController.animateTo(
                        scrollController.position.maxScrollExtent,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.bounceIn);
                    textEditingController.text = "";
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
