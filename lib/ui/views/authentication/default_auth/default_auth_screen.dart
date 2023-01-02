
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bells_mirror/ui/route/route_names.dart';
import 'package:bells_mirror/utils/constant_string.dart';

import 'default_auth_controller.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DefaultAuthController>(
      init: DefaultAuthController(),
      builder: (model){
        return Scaffold(
          appBar: AppBar(

            centerTitle: true,
            title: Text(
              "Welcome",
              style:
              TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
            ),
          ),

          body: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 70.h),
            child: Column(

              children: [
                Expanded(
                  child: Container(
                    height: 400.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Constant.orderTransactionConfirmed)
                      )
                    ),
                  ),
                ),

                SizedBox(
                  height: 10.h,
                ),

                Text(
                  "Welcome to Deggia",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      fontSize: ScreenUtil().setSp(25, allowFontScalingSelf: true),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "This is the app for registered vendors. To Continue please login to your vendor account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(14, allowFontScalingSelf: true),
                      color: Theme.of(context).primaryColorLight),
                ),

                SizedBox(
                  height: 71.h,
                ),
                InkWell(
                  onTap: (){

                    Get.toNamed(RouteName.login);

                   // Get.toNamed(RouteName.homeScreen);
                  },
                  child: Container(
                    height: 55.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor),
                    child: Center(
                      child: Text(
                     "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                            ScreenUtil().setSp(15, allowFontScalingSelf: true)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
