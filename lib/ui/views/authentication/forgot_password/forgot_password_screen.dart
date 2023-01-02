
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bells_mirror/ui/shared/full_screen_dialog_appbar.dart';
import 'package:bells_mirror/utils/constant_string.dart';
import 'package:bells_mirror/utils/locator.dart';

import 'forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setupScreenUtil(context);
    return GetBuilder<ForgotPasswordController>(
        init: ForgotPasswordController(),
        builder: (model) {
          return Scaffold(
            appBar: fullScreenDialogAppBar(title: ""),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Column(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              width: 150,
                              height: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(Constant.logoImage),
                                      fit: BoxFit.contain)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenUtil()
                                    .setSp(24, allowFontScalingSelf: true)),
                          ),
                          Text(
                            "We can help",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenUtil()
                                    .setSp(24, allowFontScalingSelf: true)),
                          ),
                          SizedBox(
                            height: 41.h,
                          ),
                          TextField(
                            focusNode: model.emailFocus,
                            onEditingComplete: () {
                              model.emailFocus.unfocus();

                            },
                            textInputAction: TextInputAction.next,
                            controller: model.emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor),
                                    borderRadius: BorderRadius.circular(25)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor),
                                    borderRadius: BorderRadius.circular(25)),
                                focusColor: Theme.of(context).primaryColor,
                                hintStyle: TextStyle(
                                    color: Theme.of(context).primaryColorLight,
                                    fontSize: ScreenUtil()
                                        .setSp(15, allowFontScalingSelf: true)),
                                hintText: "Enter your email address"),
                            style: TextStyle(
                                color:
                                Theme.of(context).textTheme.bodyText1.color,
                                fontSize: ScreenUtil()
                                    .setSp(15, allowFontScalingSelf: true)),
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 51.h,
                      ),
                      InkWell(
                        onTap: model.forgotPasswordClicked,
                        child: Container(
                          height: 55.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xff5584DF)),
                          child: Center(
                            child: Text(
                              "reset password".toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenUtil()
                                      .setSp(15, allowFontScalingSelf: true)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      TextButton(
                          onPressed: model.loginClicked,
                          child: Text(
                            "Login",
                            style: TextStyle(color: Color(0xff6EEB67)),
                          )),
                      SizedBox(
                        height: 50.h,
                      ),
                      Text(
                        "Created by Malik",
                        style: TextStyle(),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  )),
            ),
          );
        });
  }
}
