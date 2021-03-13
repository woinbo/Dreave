import 'package:flutter/material.dart';
import 'package:solution_challenge/config/assets.dart';

class InternetConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: 
        Column(
          children: [
          Expanded(
            flex:1,
                  child: Image.asset(
                  Assets.logo,
                  scale: 24,
              ),
            ),
            Expanded(
             flex:5,
             child:Image.asset(
               Assets.kSpace,
               scale: 12,
               )
             ),  
          Expanded(
            flex:1,
            child: Text(
              "NO INTERNET CONNECTION",
              style: TextStyle(fontSize:25),
            )
          ),
          Expanded(
            flex :1,
            child: Text(
              "To serve you the best user experience we need network services to access the realtime  posts & contents",
              style: TextStyle(fontSize:20),
            ),
            ),
          Expanded(
                  flex:2,
                      child: GestureDetector(
                           
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 80, vertical: 16),
                            decoration: BoxDecoration(
                              color: Color(0xff5222D0),
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                            ),
                            child: Text(
                            "Retry",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ),
          )
           ],
         ),
     );
   }
 }

