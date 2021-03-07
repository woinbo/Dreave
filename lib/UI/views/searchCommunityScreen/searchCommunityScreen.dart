import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solution_challenge/UI/views/authScreen/authController.dart';
import 'package:solution_challenge/UI/widgets/divider.dart';
import 'package:solution_challenge/config/assets.dart';

@override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: IntrinsicHeight(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(Assets.logo),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 100),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(70.0),
                        topLeft: Radius.circular(70.0),
                      ),
                      color: Color(0xffD1E7F8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Welcome to the\nCommunity.",
                          style: TextStyle(
                            fontSize: 31,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Connect with people.",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Form(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: TextFormField(
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                    labelText: "Search..",
                                    hintText: "Search..",
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                          "Search the community using a #symbol.\n If you could not find yours add one",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                         
                        
                           
                        
                        
                     
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                  ),
                  
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  


