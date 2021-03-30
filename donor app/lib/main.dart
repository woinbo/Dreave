import 'package:donor_app/donorHomeScreen/homeScreen.dart';
import 'package:donor_app/donorSearch/donorSearch.dart';
import 'package:donor_app/onboardingScreen/onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => {
      WidgetsFlutterBinding.ensureInitialized(),
      runApp(MaterialApp(home: App(),
      debugShowCheckedModeBanner: false,))
    };

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        HomeScreen();
  }
}


