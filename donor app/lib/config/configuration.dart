import 'package:flutter/material.dart';

// Colors
const Color primaryWhite = Colors.white;
const Color progressBarColor = Color(0xff2455EF);
const Color primaryBlue = Color(0xff2AA4F4);
const Color cardBlue = Color.fromRGBO(151, 214, 255, 1);
const Color deckBlue = Color(0xff3892CB);
//KEYS

const String IS_LOGGED_IN = "IS_LOGGED_IN";
const String IS_FIRST_TIME = "IS_FIRST_TIME";
const String USER = "USER";

// Api Keys

final String weatherApiKey = "d26745b5e558f51ab65f0d86f524dafc";
final weatherApiUrl = "https://api.openweathermap.org/data/2.5/weather?";

// Styling
TextStyle dreaveTextStyle = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    fontSize: 35,
    color: Colors.black);
TextStyle headingTextStyle =
    TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w700, fontSize: 25);

TextStyle titleTextStyle =
    TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w700, fontSize: 20);
// Shadows
