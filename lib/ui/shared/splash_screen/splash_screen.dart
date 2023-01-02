
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bells_mirror/ui/theme/theme_dark.dart';
import 'package:bells_mirror/utils/constant_string.dart';
import 'package:bells_mirror/utils/locator.dart';

import 'splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // setupScreenUtil();
    ScreenUtil.init(context,
        designSize: Size(375, 812), allowFontScaling: true);

    return GetBuilder<SplashScreenController>(
     init: SplashScreenController(),
     builder: (model){
       return Scaffold(

         body: Center(
           child:  Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                 width: 150,
                 height: 100,
                 decoration: BoxDecoration(
                     image: DecorationImage(image: AssetImage(Constant.logoImage),
                         fit: BoxFit.contain
                     )
                 ),
               ),

               SizedBox(
                 height: 10,
               ),

               Text("bells mirror".toUpperCase(), style: TextStyle(
                 color: Color(0xffBC7F2E),
                 fontSize: 16,
                 fontWeight: FontWeight.bold
               ),)
             ],
           ),
         )
       );
     },
   );
  }
}
