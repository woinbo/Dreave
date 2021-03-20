import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            Assets.kBackIcon,
            scale: 5,
          ),
        ),
        title: Text("Mr. Benest"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Color(0xff32BDEF),
            ),
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
                flex: 8,
                child: Scrollbar(
                  child: ListView.builder(
                    reverse: false,
                    controller: scrollController,
                    itemCount: chat.length,
                    itemBuilder: (context, index) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 278),
                        child: Column(
                          crossAxisAlignment: chat[index].isme
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: chat[index].isme ? 60 : 10,
                                right: chat[index].isme ? 10 : 60,
                                top: 20,
                                bottom: 8.0,
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 12),
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
                                ),
                              ),
                              child: Text(
                                chat[index].message,
                                style: TextStyle(
                                  color: chat[index].isme
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Text(
                                "9:12 PM",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                decoration: BoxDecoration(
                  color: Color(0xff2AA4F4).withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Image.asset(Assets.kEmojy),
                      iconSize: 36,
                      onPressed: () {
                        chat.add(Chat(
                            message: textEditingController.text, isme: true));
                        setState(() {
                          scrollController.animateTo(
                              scrollController.position.maxScrollExtent,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.bounceIn);
                          textEditingController.text = "";
                        });
                      },
                    ),
                    Expanded(
                      flex: 8,
                      child: TextField(
                        controller: textEditingController,
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                          ),
                          hintText: "Message...",
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(
                              0.2,
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: textEditingController.text.isNotEmpty
                          ? Icon(
                              FontAwesomeIcons.telegramPlane,
                              color: Color(
                                0xff199BE2,
                              ),
                            )
                          : Image.asset(
                              Assets.kPinDoc,
                              scale: 4,
                            ),
                      iconSize: 30,
                      onPressed: () {
                        if (textEditingController.text.isNotEmpty) {
                          chat.add(
                            Chat(
                                message: textEditingController.text,
                                isme: true),
                          );
                        }
                        setState(() {
                          scrollController.animateTo(
                            scrollController.position.maxScrollExtent,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.bounceIn,
                          );
                          textEditingController.text = "";
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
