import 'package:flutter/material.dart';
import 'package:solution_challenge/config/assets.dart';

class AfterSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.logo),
          Text("DREAVE"),
        ],
      ),
    );
  }
}
