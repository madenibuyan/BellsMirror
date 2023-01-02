

import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bells_mirror/Services/auth_service/auth_service.dart';
import 'package:bells_mirror/ui/shared/info_snackbar.dart';
import 'package:bells_mirror/ui/shared/loading_dialog.dart';
import 'package:bells_mirror/ui/views/authentication/login/login_screen.dart';
import 'package:bells_mirror/ui/views/authentication/register/register_screen.dart';
import 'package:bells_mirror/utils/locator.dart';
import 'package:bells_mirror/utils/validator.dart';

import '../check_email_screen.dart';

class ForgotPasswordController extends GetxController {
  AuthService _authService = locator<AuthService>();

  TextEditingController emailController = TextEditingController();


  FocusNode emailFocus = FocusNode();



  bool isConnected = true;

  StreamSubscription<ConnectivityResult> _streamSubscription;




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


  Future<bool> checkConnection () async{
    var result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }

  void listenConnection() async{
    isConnected = await checkConnection();
    _streamSubscription =  Connectivity().onConnectivityChanged.listen((event) {
      isConnected = event != ConnectivityResult.none;
    });
  }

  void loginClicked() {
    Get.off(LoginScreen(), fullscreenDialog: true);
  }

  void forgotPasswordClicked() async {
    String email = emailController.text;

    if (!Validators.validateEmail(email)) {
      _showSnackBar(message: "please enter a valid email");
      return;
    }

    emailFocus.unfocus();


    if(!isConnected){
      showInfoSnackBar(message: "No network connection");
      return;
    }

    loadDialog(title: "Please Hold on", dismiss: false);

    var data = await _authService.passwordReset(
      email: email,
    );

    if (data != AuthResultStatus.successful) {

      Get.back();
      
      _showSnackBar(message: data);

      return;
    }


    Get.back();

    ///Goes to new screen
    String _title = "Check your mail";
    String _message =
        "We have sent you password reset instructions (also check the Spam folder).";
    Get.off(
        CheckEmailScreen(
          email: email,
          message: _message
        ),
        fullscreenDialog: true);
  }

  void goToSignUp() {
    Get.off(RegisterScreen(


    ), fullscreenDialog: true);
  }

  _showSnackBar({String message}) {
    if (!Get.isSnackbarOpen) {
      Get.rawSnackbar(messageText: Text(message, style: TextStyle(
          color: Colors.white
      ),));
    }
  }
}
