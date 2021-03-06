import 'package:flutter/material.dart';
import 'package:solution_challenge/config/assets.dart';

const String title = 'DREAVE';
const Color primaryColor = Color(0xffD1E7F8);

//KEYS

const String IS_LOGGED_IN = "IS_LOGGED_IN";
const String IS_FIRST_TIME = "IS_FIRST_TIME";
const String USER = "USER";

//ROUTES
class ROUTES {
  static const String INITIAL = '/';
  static const String HOME = '/home';
  static const String AUTH = '/auth';
  static const String ENTER_SYM = "/comm_search";
  static const String CREATE_POST_SCREEN = "/create_post";
  static const String COMMUNITY_DES = "/communityDescription";
  static const String IDENTITY = "/identity";
  static const String COMMUNICATION_REGISTRATION =
      "/communityRegistrationScreen";
  static const String DOCTOR_REGIS_COMPLETE = "/verifyIdenityComplete";
  static const String CHATTING = "/Chatting";
  static const String PENDING_CHAT = "/PendingChat";
  static const String CREATE_POST = "/CreatePost";
}
