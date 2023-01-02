
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bells_mirror/ui/shared/full_screen_dialog_appbar.dart';
import 'package:bells_mirror/ui/views/authentication/login/login_screen.dart';
import 'package:bells_mirror/utils/constant_string.dart';
class CheckEmailScreen extends StatelessWidget {

  final String  email;
  String message;


  CheckEmailScreen({this.email, this.message}) {
   if(message == null){
     message = "Mail verification link has been sent to your email.";
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fullScreenDialogAppBar(
        title: ""
      ),
      body: Padding(
        padding:  EdgeInsets.only(
          left: 20,
          right: 20
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                width: 70.w,
                height: 70.w,
                decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(Constant.logoImage))),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),

            SizedBox(
              height: 20.h,
            ),

            Text(
             message,
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: ScreenUtil().setSp(16, allowFontScalingSelf: true),
              ),
            ),

            SizedBox(
              height: 20.h,
            ),
            Text(
              email,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                fontSize: ScreenUtil().setSp(16, allowFontScalingSelf: true),
              ),
            ),


            SizedBox(
              height: 50.h,
            ),

            Center(
              child: Container(
                width: 120.w,
                height: 120.w,
                decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(Constant.checkedIcon))),
              ),
            ),


            SizedBox(
              height: 20.h,
            ),

            Center(
              child: Text("SUCCESSFULLY SENT", style: TextStyle(
                fontSize: 16
              ),)
            ),

            SizedBox(
              height: 50.h,
            ),

            InkWell(
              onTap: (){
                Get.to(LoginScreen(), transition: Transition.rightToLeft);
              },
              child: Container(
                height: 55.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xff5584DF)),
                child: Center(
                  child: Text(
                    "login".toUpperCase(),
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
  }
}
