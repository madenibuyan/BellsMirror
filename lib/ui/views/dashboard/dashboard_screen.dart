import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bells_mirror/ui/views/home_screen_controller.dart';
import 'package:bells_mirror/utils/constant_string.dart';

import 'dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return GetBuilder<DashboardController>(
       init: DashboardController(),
       builder: (model){
     return SingleChildScrollView(
       physics: BouncingScrollPhysics(),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Container(
               width: Get.width,
               height: Get.height * 0.4,
               decoration: BoxDecoration(
                   gradient: LinearGradient(
                       begin: Alignment.topRight,
                       end: Alignment.bottomLeft,
                       colors: [
                         Color(0xff5584DF),
                         Color(0xff00F98D),
                       ])),
               child: Padding(
                 padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     SizedBox(
                       height: 20,
                     ),
                     Text(
                       "Welcome,",
                       style: TextStyle(
                           fontSize: 25,
                           fontWeight: FontWeight.bold,
                           color: Colors.white),
                     ),
                     Text(
                       model.getStudentName().capitalizeFirst,
                       style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                           color: Colors.white),
                     ),
                     Text(
                       "How can we help you today,",
                       style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                           color: Colors.white),
                     ),
                   ],
                 ),
               )),
           Padding(
             padding: EdgeInsets.only(left: 20, right: 20, top: 20),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Expanded(
                       child: Card(
                         elevation: 5,
                         child: InkWell(
                           onTap: (){
                             model.closeDrawer(HomeMenu.appointment);

                           },
                           child: Container(
                             width: Get.width,
                             height: Get.height / 4.5,
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Expanded(
                                       child: Container(
                                         height: 50,
                                         width: 50,
                                         decoration: BoxDecoration(
                                             image: DecorationImage(
                                                 image: AssetImage(
                                                     Constant.stethoscopeImage))),
                                       )),
                                   Text(
                                     "Book an appointment",
                                     textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 16),
                                   )
                                 ],
                               ),
                             ),
                           ),
                         ),
                       ),
                     ),
                     SizedBox(
                       width: 15,
                     ),
                     Expanded(
                       child: Card(

                         elevation: 5,
                         child: InkWell(
                           onTap: (){

                             model.closeDrawer(HomeMenu.pill_reminder);
                           },
                           child: Container(
                             width: Get.width,
                             height: Get.height / 4.5,
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Expanded(
                                       child: Container(
                                         height: 50,
                                         width: 50,
                                         decoration: BoxDecoration(
                                             image: DecorationImage(
                                                 image:
                                                 AssetImage(Constant.pillsImage))),
                                       )),
                                   Text(
                                     "Set pill reminder  ",
                                     textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 16),
                                   )
                                 ],
                               ),
                             ),
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
                 SizedBox(
                   height: 50,
                 ),
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Expanded(
                       child: Card(
                         elevation: 5,
                         child: Container(
                           width: Get.width,
                           height: Get.height / 4.5,
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 Expanded(
                                     child: Container(
                                       height: 50,
                                       width: 50,
                                       decoration: BoxDecoration(
                                           image: DecorationImage(
                                               image:
                                               AssetImage(Constant.lightIcon))),
                                     )),
                                 Text(
                                   "Appearance",
                                   textAlign: TextAlign.center,
                                   style: TextStyle(fontSize: 16),
                                 )
                               ],
                             ),
                           ),
                         ),
                       ),
                     ),
                     SizedBox(
                       width: 15,
                     ),
                     Expanded(
                       child: Card(
                         elevation: 5,
                         child: InkWell(
                           onTap: (){
                             model.closeDrawer(HomeMenu.notifications);
                           },
                           child: Container(
                             width: Get.width,
                             height: Get.height / 4.5,
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Expanded(
                                       child: Container(
                                         height: 50,
                                         width: 50,
                                         decoration: BoxDecoration(
                                             image: DecorationImage(
                                                 image:
                                                 AssetImage(Constant.alarmClock))),
                                       )),
                                   Text(
                                     "Notification ",
                                     textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 16),
                                   )
                                 ],
                               ),
                             ),
                           ),
                         ),
                       ),
                     ),
                   ],
                 )
               ],
             ),
           ),

           SizedBox(
             height: 10,
           ),
         ],
       ),
     );
   });
  }
}

class CurveArc extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5;
    paint.color = Colors.white;

    final path = Path();

    path.moveTo(0, size.height * 0.95);

    //   path.lineTo( size.width * 0.35, size.height * 0.75);

    path.quadraticBezierTo(
        0, size.height * 0.85, size.width * 0.25, size.height * 0.7);

    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
        size.width * 0.25, size.height * 0.6);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
