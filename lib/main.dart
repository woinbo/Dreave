import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter App",
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
 @override
  Widget build(BuildContext context) {
    
    return MaterialApp(   
      debugShowCheckedModeBanner: false,
      home: Scaffold(   
        
           
        body: Center(   
          child: Column(               
            children: <Widget>[   
              Image.asset('assets/images/Dreave_Logo.jpg'),   
               Image.asset('asset/images/People.svg'),
              Image.asset('asset/images/Sign_In.svg'),
            ],  
             
          ),   
        ),   
      ),   
    );   
  }


}
