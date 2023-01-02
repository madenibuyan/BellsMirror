import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bells_mirror/ui/shared/full_screen_dialog_appbar.dart';
import 'package:bells_mirror/ui/theme/theme_light.dart';
import 'package:bells_mirror/utils/constant_string.dart';
import 'package:bells_mirror/utils/locator.dart';

import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setupScreenUtil(context);
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (model) {
          return Scaffold(
            body: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: Get.height * 0.5,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xff4E9AF1), Color(0xffBC7F2E)]),
                    ),
                  ),
                ),
                Positioned(
                  top: Get.height * 0.1,
                  bottom: Get.height * 0.82,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Constant.logoImage),
                            fit: BoxFit.contain)),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: Get.height * 0.3,
                  bottom: 20,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: 500,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      child: Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Padding(
                                padding:
                                    EdgeInsets.only(left: 20.w, right: 20.w),
                                child: Column(
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Existing User?",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: ScreenUtil().setSp(24,
                                                  allowFontScalingSelf: true)),
                                        ),
                                        Text(
                                          "Register Account",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: ScreenUtil().setSp(24,
                                                  allowFontScalingSelf: true)),
                                        ),
                                        SizedBox(
                                          height: 41.h,
                                        ),
                                        TextField(
                                          focusNode: model.emailFocus,
                                          onEditingComplete: () {
                                            model.emailFocus.unfocus();
                                            FocusScope.of(context).requestFocus(
                                                model.passwordFocus);
                                          },
                                          textInputAction: TextInputAction.next,
                                          controller: model.emailController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                  borderRadius: BorderRadius.circular(
                                                      25)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                  borderRadius: BorderRadius.circular(
                                                      25)),
                                              focusColor: Theme.of(context)
                                                  .primaryColor,
                                              hintStyle: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColorLight,
                                                  fontSize: ScreenUtil().setSp(15, allowFontScalingSelf: true)),
                                              hintText: "Enter your email address"),
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  .color,
                                              fontSize: ScreenUtil().setSp(15,
                                                  allowFontScalingSelf: true)),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        TextField(
                                          focusNode: model.passwordFocus,
                                          obscureText: model.hidePassword,
                                          onEditingComplete: () {
                                            model.passwordFocus.unfocus();
                                          },
                                          controller: model.passwordController,
                                          textInputAction: TextInputAction.done,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            focusColor:
                                                Theme.of(context).primaryColor,
                                            suffixIcon: IconButton(
                                                icon: Icon(
                                                  model.hidePassword
                                                      ? Icons.visibility_off
                                                      : Icons.visibility,
                                                  color: Colors.grey,
                                                ),
                                                onPressed:
                                                    model.togglePassword),
                                            hintText: "Enter your password",
                                            hintStyle: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColorLight,
                                                fontSize: ScreenUtil().setSp(15,
                                                    allowFontScalingSelf:
                                                        true)),
                                          ),
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  .color,
                                              fontSize: ScreenUtil().setSp(15,
                                                  allowFontScalingSelf: true)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 51.h,
                                    ),
                                    InkWell(
                                      onTap: model.loginClicked,
                                      child: Container(
                                        height: 55.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Color(0xff5584DF)),
                                        child: Center(
                                          child: Text(
                                            "Login".toUpperCase(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: ScreenUtil().setSp(15,
                                                    allowFontScalingSelf:
                                                        true)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 21.h,
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Checkbox(
                                          value: model.loginType,
                                          onChanged:
                                            model.updateLoginType,
                                        ),

                                        Text(
                                          "Admin Login",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),

                                      ],
                                    ),
                                    SizedBox(
                                      height: 21.h,
                                    ),
                                    TextButton(
                                        onPressed: model.goToForgotPassword,
                                        child: Text(
                                          "Forgot Password",
                                          style: TextStyle(
                                              color: Color(0xff6EEB67)),
                                        )),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    TextButton(
                                        onPressed: model.goToSignUp,
                                        child: Text(
                                          "Register",
                                          style: TextStyle(
                                              color: Color(0xff6EEB67)),
                                        )),
                                    SizedBox(
                                      height: 50.h,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                  ],
                                )),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
