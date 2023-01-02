import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bells_mirror/Services/auth_service/auth_service.dart';
import 'package:bells_mirror/Services/cloud_function/cloud_function_service.dart';
import 'package:bells_mirror/ui/shared/info_snackbar.dart';
import 'package:bells_mirror/ui/shared/loading_dialog.dart';
import 'package:bells_mirror/ui/views/authentication/forgot_password/forgot_password_screen.dart';
import 'package:bells_mirror/ui/views/authentication/login/login_screen.dart';
import 'package:bells_mirror/utils/locator.dart';
import 'package:bells_mirror/utils/validator.dart';

import '../check_email_screen.dart';

class RegisterController extends GetxController {
  AuthService _authService = locator<AuthService>();
  CloudFunctionService _cloudFunctionService = locator<CloudFunctionService>();

  TextEditingController nameController = TextEditingController();
  TextEditingController matricController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  bool isConnected = true;

  StreamSubscription<ConnectivityResult> _streamSubscription;

  bool hidePassword = true;
  bool hidePasswordSecond =  true;

  Gender gender = Gender.male;

  Map<String, dynamic> data = {};

  @override
  void onInit() {
    super.onInit();
    listenConnection();
  }

  @override
  void onClose() {
    _streamSubscription?.cancel();
    super.onClose();
  }

  Future<bool> checkConnection() async {
    var result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }

  void listenConnection() async {
    isConnected = await checkConnection();
    _streamSubscription = Connectivity().onConnectivityChanged.listen((event) {
      isConnected = event != ConnectivityResult.none;
    });
  }

  bool formatData() {
    String name = nameController.text.trim();
    String matric = matricController.text.trim();
    String phone = phoneController.text.trim();

    String email = emailController.text;
    String password = passwordController.text.trim();
    String confirmPassword = passwordController.text.trim();

    if (!Validators.validateEmail(email)) {
      showInfoSnackBar(message: "please enter a valid email");
      return false;
    }

    if (password.length < 6) {
      showInfoSnackBar(message: "password is too short");
      return false;
    }

    if (confirmPassword.toLowerCase() != password.toLowerCase()) {
      showInfoSnackBar(message: "Password do not match");
      return false;
    }

    if (name.length < 3) {
      showInfoSnackBar(message: "Name must be greater than 3 characters");
      return false;
    }

    if (matric.length < 9) {
      showInfoSnackBar(message: "Invalid matric number");
      return false;
    }

    var formatedMatric = matric.split("/");

    if (formatedMatric.length != 2) {
      showInfoSnackBar(message: "Invalid matric number");
      return false;
    }

    var firstPart = formatedMatric[0];
    var secondPart = formatedMatric[1];

    if (firstPart.length != 4 || secondPart.length != 4) {
      showInfoSnackBar(message: "Invalid matric number");
      return false;
    }

    int valueOne = int.tryParse(firstPart);
    int valueTwo = int.tryParse(secondPart);

    if (valueOne == null || valueTwo == null) {
      showInfoSnackBar(message: "Invalid matric number");
      return false;
    }

    if(phone.length != 11 || int.tryParse(phone) == null){

      showInfoSnackBar(message: "Invalid phone number");
      return false;
    }

    data = {
      "name" : name,
      "gender" : gender == Gender.male ? "Male" : "Female",
      "matric" : matric,
      "phoneNumber" : phone,
      "email" : email,
      "password" : password
    };

    return true;
  }

  void registerClicked() async {


    if(!formatData()){
      return;
    }

    emailFocus.unfocus();
    passwordFocus.unfocus();

    if (!isConnected) {
      showInfoSnackBar(message: "No network connection");
      return;
    }


    loadDialog(title: "Please Hold", dismiss: true);


  var result = await _cloudFunctionService.callFunction(name: "createUserAccount", data: data);




    ///Goes to new screen
    Get.back();



    if(result == -2){

      showInfoSnackBar(message: "User with matric number already exist");
      return;
    }

    if(result == -3){

      showInfoSnackBar(message: "User with email already exist");
      return;
    }


    if(result != 1){

      showInfoSnackBar(message: "User registration failed");
      return;
    }



    Get.to(CheckEmailScreen(email: emailController.text.trim(),),
        fullscreenDialog: true);
  }

  void loginClicked() async {
    Get.off(LoginScreen(), fullscreenDialog: true);
  }

  void goToForgotPassword() {
    Get.off(ForgotPasswordScreen(), fullscreenDialog: true);
  }

  _showSnackBar({String message}) {
    if (!Get.isSnackbarOpen) {
      Get.rawSnackbar(
          messageText: Text(
        message,
        style: TextStyle(color: Colors.white),
      ));
    }
  }

  void togglePassword() {
    hidePassword = !hidePassword;
    update();
  }

  String getTitle({Gender gender}) {
    switch (gender) {
      case Gender.male:
        return "Male";

      case Gender.female:
        return "Female";

      default:
        return "Male";
    }
  }

  void selectDatePressed(Gender gender) async {
    this.gender = gender;
    update();
  }

  void togglePasswordSecond() {
    hidePasswordSecond = !hidePasswordSecond;
    update();
  }
}

enum Gender { male, female }
