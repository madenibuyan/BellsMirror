
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bells_mirror/ui/shared/onboarding_screen.dart';
import 'package:bells_mirror/ui/shared/splash_screen/splash_screen.dart';
import 'package:bells_mirror/ui/views/authentication/default_auth/default_auth_screen.dart';
import 'package:bells_mirror/ui/views/authentication/login/login_screen.dart';
import 'package:bells_mirror/ui/views/authentication/register/register_screen.dart';
import 'package:bells_mirror/ui/views/home_screen.dart';

class RouteName {
  static const String login = "login";
  static const String register = "register";

  static const String on_boarding = "/on_boarding";

  static const String splash_screen = "splash_screen";

  static const String  homeScreen = "/home_screen";

  static const String  default_auth = "/default_auth";


  //then
  static List<GetPage> getPages(){

    var pages =[




      GetPage(
        name: on_boarding,
        settings: RouteSettings(
          name: on_boarding,

        ),
        page: () => OnBoardingScreen(),
      ),

      GetPage(
        name: default_auth,
        settings: RouteSettings(
          name: default_auth,

        ),
        page: () => AuthScreen(),
      ),

      GetPage(
        name: homeScreen,
        settings: RouteSettings(
          name: homeScreen,

        ),
        page: () => HomeScreen(),
      ),



      GetPage(
        name: login,
        settings: RouteSettings(
          name: login,

        ),
        page: () => LoginScreen(),
      ),

      GetPage(
        name: register,
        settings: RouteSettings(
          name: register,

        ),
        page: () => RegisterScreen(),
      ),

      GetPage(
        name: splash_screen,
        settings: RouteSettings(
          name: splash_screen,
        ),
        page: () => SplashScreen(),
      ),

    ];

    return pages;

  }
}
