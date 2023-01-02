
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bells_mirror/Services/auth_service/auth_service.dart';
import 'package:bells_mirror/Services/local_storage_service/storage_service.dart';
import 'package:bells_mirror/ui/route/route_names.dart';
import 'package:bells_mirror/utils/constant_string.dart';
import 'package:bells_mirror/utils/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {

  AuthService _authService = locator<AuthService>();

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {


    await Future.delayed(Duration(milliseconds: 1000));



    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool isFirstTime =  preferences.getBool(Constant.firstTimeUser) ?? true;
    if (isFirstTime) {
      await preferences.setBool(Constant.firstTimeUser, !isFirstTime);
       Get.offAndToNamed(RouteName.on_boarding);
    } else {
      if(_authService.isLoggedIn()){
        Get.offAndToNamed(RouteName.homeScreen);
      } else {
        Get.offAndToNamed(RouteName.login);
      }
    }

  }

}
