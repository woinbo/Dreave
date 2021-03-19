import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solution_challenge/config/assets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PendingChat extends StatefulWidget {
  @override
  _PendingChat createState() => _PendingChat();
}

class Pend {
  String name;
  String comName;
  String image;
  String country;

  Pend({this.name, this.image, this.comName, this.country});
}

class _PendingChat extends State<PendingChat> {
  ScrollController scrollController;
  List<Pend> request = [
    Pend(
        name: "MR.Benest",
        image:
            "https://images.pexels.com/photos/4107337/pexels-photo-4107337.jpeg",
        comName: "COVID19",
        country: "INDIA"),
    Pend(
        name: "MRS.DAISY",
        image:
            "https://images.pexels.com/photos/4107337/pexels-photo-4107337.jpeg",
        comName: "COVID19",
        country: "INDIA"),
    Pend(
        name: "MR.SPONGEBOB",
        image:
            "https://images.pexels.com/photos/4107337/pexels-photo-4107337.jpeg",
        comName: "COVID19",
        country: "INDIA"),
  ];
  @override
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
          Assets.klogo,
          scale: 1.5,
        ),
        title: Text("COVERSE"),
        actions: [Image.asset(Assets.kProfileEdit)],
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
                    return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      child: Container(
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
                            color: Color(0xffF5F5F5).withOpacity(0.7)),
                        child: ListTile(
                          leading: Container(
                            width: 45,
                            height: 45,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(request[index].image)),
                          ),
                          title: Text(
                            request[index].name,
                            style: TextStyle(fontSize: 20),
                          ),
                          subtitle: Text(
                            request[index].comName,
                            style: TextStyle(fontSize: 15),
                          ),
                          trailing: Text(
                            request[index].country,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: IconSlideAction(
                              caption: 'Accept',
                              color: Colors.green,
                              icon: FontAwesomeIcons.check,
                              onTap: () => print("left"),
                            ),
                          ),
                        ),
                      ],
                      secondaryActions: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: IconSlideAction(
                              caption: 'Delete',
                              color: Colors.red,
                              icon: Icons.delete,
                              onTap: () => print("right"),
                            ),
                          ),
                        ),
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
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff155CDE),
        child: Icon(FontAwesomeIcons.plus, color: Color(0xffFFFFFF)),
        onPressed: null,
      ),
    );
  }
}
