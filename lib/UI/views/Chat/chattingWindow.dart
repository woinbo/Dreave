import 'package:flutter/material.dart';
import 'package:solution_challenge/config/assets.dart';

class Chatting extends StatefulWidget {
  @override
  _Chatting createState() => _Chatting();
  }
  
  class _Chatting  extends State<Chatting>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Image.asset(
          Assets.logo,
          scale: 1.5,
        ),
        title: Text("Mr. Benest"),
        actions: [IconButton(icon: Icon(Icons.ac_unit), onPressed: (){},)],
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      
    );
  }
    
    
}
