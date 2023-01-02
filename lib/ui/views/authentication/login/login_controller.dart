import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bells_mirror/ui/views/authentication/admin_homepage.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bells_mirror/Services/auth_service/auth_service.dart';
import 'package:bells_mirror/ui/route/route_names.dart';
import 'package:bells_mirror/ui/shared/info_snackbar.dart';
import 'package:bells_mirror/ui/shared/loading_dialog.dart';
import 'package:bells_mirror/ui/views/authentication/forgot_password/forgot_password_screen.dart';
import 'package:bells_mirror/ui/views/authentication/login/login_screen.dart';
import 'package:bells_mirror/ui/views/authentication/register/register_screen.dart';
import 'package:bells_mirror/utils/locator.dart';
import 'package:bells_mirror/utils/validator.dart';

import '../check_email_screen.dart';

class LoginController extends GetxController {
  AuthService _authService = locator<AuthService>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  bool isConnected = true;

  bool loginType = false;

  StreamSubscription<ConnectivityResult> _streamSubscription;

  bool hidePassword = true;

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

  void loginClicked() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (!Validators.validateEmail(email)) {
      _showSnackBar(message: "please enter a valid email");
      return;
    }

    if (password.trim().length < 6) {
      _showSnackBar(message: "password is too short.");
      return;
    }

    if (!isConnected) {
      showInfoSnackBar(message: "No network connection");
      return;
    }

    emailFocus.unfocus();
    passwordFocus.unfocus();

    loadDialog(title: "Taking you in", dismiss: false);

    var data = await _authService.login(email: email, password: password);

    if (data != AuthResultStatus.successful) {
      Get.back();

      _showSnackBar(message: data);

      return;
    }

    emailController.clear();
    passwordController.clear();

    if (loginType) {
      // admin login is checked

      var admin = await _authService.isAdmin();

      if (admin) {
        //clear, it's an admin login


        Get.off(AdminHomePage(), transition: Transition.leftToRight);

        return;
      }

      Get.back();

     await _authService.signOut();

      showInfoSnackBar(message: "Could not very admin account");

      return;
    }

    if (!_authService.isEmailVerified()) {
      await _authService.sendEmailVerification();
      Get.off(
          CheckEmailScreen(
            email: email,
          ),
          fullscreenDialog: true,
          transition: Transition.rightToLeft);
      return;
    }

    Get.offAllNamed(RouteName.homeScreen);
  }

  void goToForgotPassword() {
    Get.off(ForgotPasswordScreen(), fullscreenDialog: true);
  }

  void goToSignUp() {
    Get.off(RegisterScreen(), fullscreenDialog: true);
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

  void updateLoginType(bool value) {
    loginType = value;
    update();
  }
}
