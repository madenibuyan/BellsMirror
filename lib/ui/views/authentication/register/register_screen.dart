
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bells_mirror/ui/shared/full_screen_dialog_appbar.dart';
import 'package:bells_mirror/ui/theme/theme_light.dart';
import 'package:bells_mirror/utils/constant_string.dart';
import 'package:bells_mirror/utils/locator.dart';

import 'register_controller.dart';

class RegisterScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    setupScreenUtil(context);

    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (model){
        return Scaffold(
          body: Stack(
            children: [
              Positioned(
                left: 0,
                  right: 0,
                  top: 0,
                  bottom: Get.height*0.5,
                  child:   Container(
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
                      image: DecorationImage(image: AssetImage(Constant.logoImage),
                          fit: BoxFit.contain
                      )
                  ),
                ),

              ),



              Positioned(
                left: 0,
                right: 0,
                top: Get.height * 0.3,
                bottom: 20,

                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20
                  ),
                  child: Container(
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight:Radius.circular(25)
                      )
                    ),

                    child: Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [

                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  SizedBox(
                                    height: 20,
                                  ),

                                  Text(
                                    "New User?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil()
                                            .setSp(30, allowFontScalingSelf: true)),
                                  ),
                                  Text(
                                    "Register Account",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil()
                                            .setSp(30, allowFontScalingSelf: true)),
                                  ),
                                  SizedBox(
                                    height: 41.h,
                                  ),

                                  TextField(
                                    onEditingComplete: (){
                                    },
                                    textInputAction: TextInputAction.next,
                                    controller: model.nameController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                                            borderRadius: BorderRadius.circular(25)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                                            borderRadius: BorderRadius.circular(25)
                                        ),
                                        focusColor: Theme.of(context).primaryColor,
                                        hintStyle: TextStyle(
                                            color: Theme.of(context).primaryColorLight,
                                            fontSize: ScreenUtil()
                                                .setSp(15, allowFontScalingSelf: true)),
                                        hintText: "Name"),
                                    style: TextStyle(
                                        color:
                                        Theme.of(context).textTheme.bodyText1.color,
                                        fontSize: ScreenUtil()
                                            .setSp(15, allowFontScalingSelf: true)),
                                  ),



                                  SizedBox(
                                    height: 20.h,
                                  ),


                                  Row(
                                    children: [
                                      PopupMenuButton<Gender>(
                                        //   initialValue: model.paymentTime,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5)
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              height: 45,
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.only(left: 10, right: 5),
                                                child: Row(

                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text("Select gender : ",
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold,

                                                            color: Theme.of(context)
                                                                .primaryColorLight)),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text("${model.getTitle(gender: model.gender)} ",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                        )),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Icon(Icons.arrow_drop_down)
                                                  ],
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(25),
                                                  border: Border.all(
                                                      color: Theme.of(context).primaryColor)),
                                            )
                                          ],
                                        ),
                                        onSelected: model.selectDatePressed,
                                        itemBuilder: (BuildContext context) {
                                          return Gender.values.map((choice) {
                                            return PopupMenuItem<Gender>(
                                              value: choice,
                                              child: Text(
                                                "${model.getTitle(gender: choice)}",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        .color),
                                              ),
                                            );
                                          }).toList();
                                        },
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 20.h,
                                  ),

                                  TextField(
                                    onEditingComplete: (){
                                    },
                                    textInputAction: TextInputAction.next,
                                    controller: model.matricController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                                            borderRadius: BorderRadius.circular(25)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                                            borderRadius: BorderRadius.circular(25)
                                        ),
                                        focusColor: Theme.of(context).primaryColor,
                                        hintStyle: TextStyle(
                                            color: Theme.of(context).primaryColorLight,
                                            fontSize: ScreenUtil()
                                                .setSp(15, allowFontScalingSelf: true)),
                                        hintText: "Matric number"),
                                    style: TextStyle(
                                        color:
                                        Theme.of(context).textTheme.bodyText1.color,
                                        fontSize: ScreenUtil()
                                            .setSp(15, allowFontScalingSelf: true)),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  TextField(

                                    onEditingComplete: (){

                                    },
                                    textInputAction: TextInputAction.next,
                                    controller: model.phoneController,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                                            borderRadius: BorderRadius.circular(25)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                                            borderRadius: BorderRadius.circular(25)
                                        ),
                                        focusColor: Theme.of(context).primaryColor,
                                        hintStyle: TextStyle(
                                            color: Theme.of(context).primaryColorLight,
                                            fontSize: ScreenUtil()
                                                .setSp(15, allowFontScalingSelf: true)),
                                        hintText: "Phone number"),
                                    style: TextStyle(
                                        color:
                                        Theme.of(context).textTheme.bodyText1.color,
                                        fontSize: ScreenUtil()
                                            .setSp(15, allowFontScalingSelf: true)),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  TextField(

                                    focusNode: model.emailFocus,
                                    onEditingComplete: (){
                                      model.emailFocus.unfocus();
                                      FocusScope.of(context).requestFocus(model.passwordFocus);
                                    },
                                    textInputAction: TextInputAction.next,
                                    controller: model.emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                                            borderRadius: BorderRadius.circular(25)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                                            borderRadius: BorderRadius.circular(25)
                                        ),
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
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  TextField(
                                    obscureText : model.hidePassword,

                                    onEditingComplete: (){
                                      model.passwordFocus.unfocus();
                                    },
                                    controller: model.passwordController,
                                    textInputAction: TextInputAction.done,
                                    decoration:
                                    InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Theme.of(context).primaryColor),
                                          borderRadius: BorderRadius.circular(25)
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Theme.of(context).primaryColor),
                                          borderRadius: BorderRadius.circular(25)
                                      ),
                                      focusColor: Theme.of(context).primaryColor,
                                      suffixIcon: IconButton(
                                          icon: Icon(
                                            model.hidePassword ?  Icons.visibility_off : Icons.visibility ,
                                            color: Colors.grey,
                                          ),
                                          onPressed: model.togglePassword),

                                      hintText: "Enter your password",  hintStyle: TextStyle(
                                        color: Theme.of(context).primaryColorLight,
                                        fontSize: ScreenUtil()
                                            .setSp(15, allowFontScalingSelf: true)),),
                                    style: TextStyle(
                                        color:
                                        Theme.of(context).textTheme.bodyText1.color,
                                        fontSize: ScreenUtil()
                                            .setSp(15, allowFontScalingSelf: true)),
                                  ),

                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  TextField(
                                    obscureText : model.hidePasswordSecond,
                                    onEditingComplete: (){

                                    },
                                    controller: model.confirmPasswordController,
                                    textInputAction: TextInputAction.done,
                                    decoration:
                                    InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Theme.of(context).primaryColor),
                                          borderRadius: BorderRadius.circular(25)
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Theme.of(context).primaryColor),
                                          borderRadius: BorderRadius.circular(25)
                                      ),
                                      focusColor: Theme.of(context).primaryColor,
                                      suffixIcon: IconButton(
                                          icon: Icon(
                                            model.hidePasswordSecond ?  Icons.visibility_off : Icons.visibility ,
                                            color: Colors.grey,
                                          ),
                                          onPressed: model.togglePasswordSecond),

                                      hintText: "confirm password",  hintStyle: TextStyle(
                                        color: Theme.of(context).primaryColorLight,
                                        fontSize: ScreenUtil()
                                            .setSp(15, allowFontScalingSelf: true)),),
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
                                onTap: model.registerClicked,
                                child: Container(
                                  height: 55.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0xff5584DF)),
                                  child: Center(
                                    child: Text(
                                      "Register".toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                          ScreenUtil().setSp(15, allowFontScalingSelf: true)),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 21.h,
                              ),


                              TextButton(onPressed: model.loginClicked, child: Text("LOGIN", style: TextStyle(
                                color: Colors.black
                              ),)),


                              SizedBox(
                                height: 50.h,
                              ),

                              SizedBox(
                                height: 20.h,
                              ),

                            ],
                          ),
                        )
                    ),

                  ),
                ),


              ),

            ],
          ),
        );
      },
    );
  }
}
