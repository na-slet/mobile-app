import 'package:flutter/material.dart';

abstract class Routes {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static const String signInPage = "/signIn";
  static const String signUpPage = "/signUp";
  static const String mainPage = "/";
  static const String feedPage = "/feed";
  static const String eventsPage = "/events";
  static const String profilePage = "/profile";
}
