import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solution_challenge/UI/views/onboardingScreen/onboarding.dart';
import 'package:solution_challenge/UI/views/searchCommunityScreen/communityDescription.dart';
import 'package:solution_challenge/UI/views/verifyMobileScreen/Identity.dart';
import 'package:solution_challenge/utils/custom_shared_preferences.dart';
import 'UI/views/afterSplashScreen/afterSplashScreen.dart';
import 'UI/views/authScreen/authScreen.dart';
import 'UI/views/createPostScreen/createPostScreen.dart';
import 'UI/views/homeScreen/homeScreen.dart';
import 'UI/views/searchCommunityScreen/searchCommunityScreen.dart';
import 'UI/widgets/custom_page_route.dart';
import 'config/constant.dart';

bool isLoggedIn;
bool isFirstTime;

void main() async => {
      WidgetsFlutterBinding.ensureInitialized(),
      await Firebase.initializeApp(),
      isFirstTime = await CustomSharedPreferences.get(IS_FIRST_TIME) ?? true,
      isLoggedIn = await CustomSharedPreferences.get(IS_LOGGED_IN) ?? false,
      runApp(
        App(),
      ),
    };

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme().copyWith(
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: TextTheme().copyWith(
            headline6: Theme.of(context).primaryTextTheme.headline6.copyWith(
                  color: Colors.black,
                ),
          ),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 72.0,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            fontSize: 36.0,
            fontStyle: FontStyle.italic,
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
            fontFamily: "Roboto",
          ),
        ),
      ),
      initialRoute: isFirstTime
          ? ROUTES.INITIAL
          : isLoggedIn
              ? ROUTES.HOME
              : ROUTES.AUTH,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case ROUTES.INITIAL:
            return PageRouteBuilder(
                pageBuilder: (_, a1, a2) => OnBoardingScreen(),
                settings: settings);

          case ROUTES.AUTH:
            return PageRouteBuilder(
                pageBuilder: (_, a1, a2) => AuthScreen(), settings: settings);
          case ROUTES.HOME:
            return PageRouteBuilder(
                pageBuilder: (_, a1, a2) => HomeScreen(), settings: settings);
          case ROUTES.SEARCH_COMM:
            return PageRouteBuilder(
                pageBuilder: (_, a1, a2) => SearchCommunityScreen(),
                settings: settings);
          case ROUTES.COMMUNITY_DES:
            return PageRouteBuilder(
                pageBuilder: (_, a1, a2) => CommunityDescription(),
                settings: settings);
          case ROUTES.CREATE_POST_SCREEN:
            return PageRouteBuilder(
                pageBuilder: (_, a1, a2) => CreatePostScreen(),
                settings: settings);
          case ROUTES.CREATE_POST_SCREEN:
            return PageRouteBuilder(
                pageBuilder: (_, a1, a2) => Identity(),
                settings: settings);
      

          default:
            return CustomPageRoute.build(
                builder: (_) => AfterSplashScreen(), settings: settings);
        }
      },
    );
  }
}
